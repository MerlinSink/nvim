local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	vim.lsp.config(ls, capabilities)
end

local opts = {
	override_foldtext = false,
}

SinkVim.lazyload.UIEnterLoad(function()
	require("ufo").setup(opts)
end)

SinkVim.keymap("n", "zr", function()
	require("ufo").openAllFolds()
end, "OpenAllFolds")
SinkVim.keymap("n", "zm", function()
	require("ufo").closeAllFolds()
end, "CloseAllFolds")
SinkVim.keymap("n", "zk", function()
	require("ufo").peekFoldedLinesUnderCursor()
end, "CloseAllFolds")
