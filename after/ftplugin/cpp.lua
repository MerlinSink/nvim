require("plugins.dap")

if vim.lsp.is_enabled("clangd") then
	require("plugins.C_CPP")
end
