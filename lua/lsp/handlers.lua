local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  vim.notify("No found cmp_nvim_lsp")
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end


local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
    [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- keymap(bufnr, "n", "gd", "<cmd>Lspsaga preview_definition()<CR>", opts)
	-- keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<CR>", opts)
	keymap(bufnr, "n", "<leader>lm", "<cmd>Mason<CR>", opts)
	-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
	-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
	-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	-- require("keymaps").lsp_keymaps(bufnr)
  lsp_highlight_document(client)

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
