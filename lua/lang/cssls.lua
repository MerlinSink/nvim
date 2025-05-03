return {
	cssls = {
		enabled = true,
		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = true,
					},
				},
			},
		},
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern("compile_commands.json", ".ccls", ".git")(fname)
		end,
		settings = {
			css = {
				validate = true,
			},
			less = {
				validate = true,
			},
			scss = {
				validate = true,
			},
		},
	},
}
