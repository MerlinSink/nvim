return {
	taplo = {
		enabled = true,
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(".git")(fname)
		end,
		filetypes = { "toml" },
		cmd = { "taplo", "lsp", "stdio" },
	},
}
