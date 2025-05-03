return {
	html = {
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
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
		},
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(".git")(fname) or vim.loop.os_homedir()
		end,
		settings = {},
	},
}
