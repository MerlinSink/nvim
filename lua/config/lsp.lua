-- config setting
local config = {
	inlay_hints = {
		enabled = true,
		exclude = { "vue" },
	},
	codelens = {
		enabled = false,
	},
}

-- inlay hints
if config.inlay_hints.enabled then
	SinkVim.lsp.on_supports_method("textDocument/inlayHint", function(_, buffer)
		if
			vim.api.nvim_buf_is_valid(buffer)
			and vim.bo[buffer].buftype == ""
			and not vim.tbl_contains(config.inlay_hints.exclude, vim.bo[buffer].filetype)
		then
			vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
		end
	end)
end

-- code lens
if config.codelens.enabled and vim.lsp.codelens then
	SinkVim.lsp.on_supports_method("textDocument/codeLens", function(_, buffer)
		vim.lsp.codelens.refresh()
		vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
			buffer = buffer,
			callback = vim.lsp.codelens.refresh,
		})
	end)
end

-- diagnostic
local diagnostics = {
	underline = true,
	update_in_insert = true,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "icons", -- {"●", "icons"}
	},
	-- virtual_lines = { current_line = true },
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = SinkVim.icons.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = SinkVim.icons.diagnostics.Warn,
			[vim.diagnostic.severity.HINT] = SinkVim.icons.diagnostics.Hint,
			[vim.diagnostic.severity.INFO] = SinkVim.icons.diagnostics.Info,
		},
	},
}

if type(diagnostics.virtual_text) == "table" and diagnostics.virtual_text.prefix == "icons" then
	diagnostics.virtual_text.prefix = function(diagnostic)
		local icons = SinkVim.icons.diagnostics
		for d, icon in pairs(icons) do
			if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
				return icon
			end
		end
	end
end

-- Setup diagnostic
vim.diagnostic.config(diagnostics)

-- Setup LSP Server
local lsp = {
	"lua_ls",
	"clangd",
}

vim.lsp.enable(lsp)

-- Set Keymaps
SinkVim.lsp.on_attach(function(client, buffer)
	local keymap = function(mode, keys, func, desc)
		vim.keymap.set(mode, keys, func, { buffer = buffer, desc = desc })
	end
    -- stylua: ignore start
	if Snacks and Snacks.picker then
        keymap("n", "<leader>cl", function() Snacks.picker.lsp_config() end, "Lsp Info")
        keymap("n", "gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
	    keymap("n", "gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
	    keymap("n", "gr", function() Snacks.picker.lsp_references() end, "References")
	    keymap("n", "gi", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
	    keymap("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")
	    keymap({ "n", "t" }, "<C-n>", function() Snacks.words.jump(vim.v.count1) end, "Next Reference")
	    keymap({ "n", "t" }, "<C-p>", function() Snacks.words.jump(-vim.v.count1) end, "Prev Reference")
	    keymap("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
	    keymap("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP Workspace Symbols")
	end
	keymap("n", "<leader>cd", function() vim.diagnostic.open_float(nil, { border = "rounded" }) end, "Show Diagnostic")
	keymap("n", "K", function() vim.lsp.buf.hover() end, "Hover")
	keymap("n", "gk", function() vim.lsp.buf.signature_help() end, "Signature Help")
	keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	keymap({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
	keymap("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
	keymap("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
	-- stylua: ignore end
end)
