return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		event = "VeryLazy",
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "double",
				width = 0.7,
				height = 0.7,
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local registry = require("mason-registry")
			local package = require("mason-lspconfig.mappings.server").lspconfig_to_package
      local util = require("config.util")
			local servers = require("lazy.core.config").plugins["nvim-lspconfig"].opts.servers
			local formatters = require("lazy.core.config").plugins["conform.nvim"].opts.formatters_by_ft

      -- LSP Servers
			local ensure_installed = {}
			for lsp, _ in pairs(servers) do
				local pkg = package[lsp]
				if pkg ~= nil then
					table.insert(ensure_installed, pkg)
				end
			end

      -- Formatters
			local seen = {}
			for _, fmt in pairs(formatters) do
				for _, tool in ipairs(fmt) do
					if not seen[tool] and registry.has_package(tool) then
						table.insert(ensure_installed, tool)
						seen[tool] = true
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
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
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
			servers = require("lang.servers")
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

			for server, _ in pairs(servers) do
				setup(server)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(mode, keys, func, desc)
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
					end
          -- stylua: ignore start
          if Snacks and Snacks.picker then
            map("n", "<leader>cl", function() Snacks.picker.lsp_config() end, "Lsp Info")
				    map("n", "gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
				    map("n", "gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
				    map("n", "gr", function() Snacks.picker.lsp_references() end, "References")
				    map("n", "gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
				    map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")
				    map({ "n", "t" }, "<C-n>", function() Snacks.words.jump(vim.v.count1) end, "Next Reference")
				    map({ "n", "t" }, "<C-p>", function() Snacks.words.jump(-vim.v.count1) end, "Prev Reference")
				    map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
				    map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP Workspace Symbols")
          end
					map("n", "gh", function() return vim.lsp.buf.hover() end, "Hover")
					map("n", "gk", function() return vim.lsp.buf.signature_help() end, "Signature Help")
					map("i", "<C-k>", function() return vim.lsp.buf.signature_help() end, "Signature Help")
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
					-- stylua: ignore end
				end,
			})
		end,
	},
}
