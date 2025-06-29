return {
	omnisharp = {
		enabled = true,
		cmd = {
			"omnisharp",
			"-z",
			"--hostPID",
			tostring(vim.fn.getpid()),
			"DotNet:enablePackageRestore=false",
			"--encoding",
			"utf-8",
			"--languageserver",
		},
		filetypes = { "cs", "vb" },
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json")(fname)
		end,
		init_options = {},
		capabilities = {
			workspace = {
				workspaceFolders = false,
			},
		},
		settings = {
			FormattingOptions = {
				EnableEditorConfigSupport = true,
				-- OrganizeImports = true,
			},
			Sdk = {
				IncludePrereleases = true,
			},
		},
	},
}
