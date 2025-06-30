return {
	csharp_ls = {
		enabled = true,
		cmd = { "csharp-ls" },
		filetypes = { "cs" },
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern("*.sln")(fname)
				or require("lspconfig.util").root_pattern("*.slnx")(fname)
				or require("lspconfig.util").root_pattern("*.csproj")(fname)
				or require("lspconfig.util").find_git_ancestor(fname)
		end,
		init_options = {
			AutomaticWorkspaceInit = true,
		},
	},
}
