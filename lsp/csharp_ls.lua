return {
	cmd = { "csharp-ls" },
	filetypes = { "cs" },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("*.sln")(fname)
			or require("lspconfig.util").root_pattern("*.slnx")(fname)
			or require("lspconfig.util").root_pattern("*.csproj")(fname)
			or vim.fs.dirname(vim.fs.find(".git", { path = vim.api.nvim_buf_get_name(0), upward = true })[1])(fname)
	end,
	init_options = {
		AutomaticWorkspaceInit = true,
	},
}
