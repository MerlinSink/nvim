return {
	"neovim/nvim-lspconfig",
	event = "LazyFile",
	dependencies = {
		{
			"mason-org/mason.nvim",
			cmd = "Mason",
			opts = {
				ui = {
					border = "double",
					width = 0.7,
					height = 0.7,
				},
			},
		},
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = true,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
				-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
				-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
				-- prefix = "icons",
			},
			virtual_line = false,
			severity_sort = true,
		},
		inlay_hints = {
			enabled = true,
			exclude = { "vue" },
		},
		codelens = {
			enabled = false,
		},
		capabilities = {
			workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			},
		},
		servers = require("lang"),
	},
	config = function(_, opts)
		local icons = require("config.icons").diagnostics
		opts.diagnostics = vim.tbl_deep_extend("force", {
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.Error,
					[vim.diagnostic.severity.WARN] = icons.Warn,
					[vim.diagnostic.severity.HINT] = icons.Hint,
					[vim.diagnostic.severity.INFO] = icons.Info,
				},
			},
		}, opts.diagnostics or {})

		local util = require("config.util")
		-- inlay hints
		if opts.inlay_hints.enabled then
			util.on_supports_method("textDocument/inlayHint", function(_, buffer)
				if
					vim.api.nvim_buf_is_valid(buffer)
					and vim.bo[buffer].buftype == ""
					and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
				then
					vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
				end
			end)
		end

		-- code lens
		if opts.codelens.enabled and vim.lsp.codelens then
			util.on_supports_method("textDocument/codeLens", function(_, buffer)
				vim.lsp.codelens.refresh()
				vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
					buffer = buffer,
					callback = vim.lsp.codelens.refresh,
				})
			end)
		end

		if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
			opts.diagnostics.virtual_text.prefix = "●"
				or function(diagnostic)
					for d, icon in pairs(icons) do
						if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
							return icon
						end
					end
				end
		end

		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		local servers = opts.servers
		local has_blink, blink = pcall(require, "blink.cmp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			has_blink and blink.get_lsp_capabilities() or {},
			opts.capabilities or {}
		)

		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})
			if server_opts.enabled == false then
				return
			end
			require("lspconfig")[server].setup(server_opts)
		end

		-- get all the servers that are available through mason-lspconfig
		require("mason").setup()
		local registry = require("mason-registry")
		local pkg = require("mason-lspconfig").get_mappings()
		local formatters = require("lazy.core.config").plugins["conform.nvim"].opts.formatters_by_ft

		local ensure_installed = {} ---@type string[]
		-- LSP Servers
		for server, _ in pairs(servers) do
			local temp = pkg[server]
			if registry.has_package(temp) then
				table.insert(ensure_installed, temp)
			end
		end

		-- Formatters
		local temp = {}
		for _, fmt in pairs(formatters) do
			for _, tool in ipairs(fmt) do
				if not temp[tool] and registry.has_package(tool) then
					table.insert(ensure_installed, tool)
					temp[tool] = true
				end
			end
		end

		ensure_installed = util.dedup(ensure_installed)

		registry.refresh(function()
			for _, tool in ipairs(ensure_installed) do
				local p = registry.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end)

		-- Setup servers
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				if server_opts.enabled ~= false then
					setup(server)
				end
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local keymap = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end
          -- stylua: ignore start
          if Snacks and Snacks.picker then
            keymap("n", "<leader>cl", function() Snacks.picker.lsp_config() end, "Lsp Info")
				    keymap("n", "gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
				    keymap("n", "gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
				    keymap("n", "gr", function() Snacks.picker.lsp_references() end, "References")
				    keymap("n", "gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
				    keymap("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")
				    keymap({ "n", "t" }, "<C-n>", function() Snacks.words.jump(vim.v.count1) end, "Next Reference")
				    keymap({ "n", "t" }, "<C-p>", function() Snacks.words.jump(-vim.v.count1) end, "Prev Reference")
				    keymap("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
				    keymap("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP Workspace Symbols")
          end
					keymap("n", "K", function() return vim.lsp.buf.hover() end, "Hover")
					keymap("n", "gk", function() return vim.lsp.buf.signature_help() end, "Signature Help")
					keymap("i", "<C-k>", function() return vim.lsp.buf.signature_help() end, "Signature Help")
					keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
          keymap({ "n", "v" },"<leader>cc", vim.lsp.codelens.run, "Run Codelens")
          keymap("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
					keymap("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
				-- stylua: ignore end
			end,
		})
	end,
}
