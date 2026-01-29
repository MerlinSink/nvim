local opts = {
	ui = {
		border = "double",
		width = 0.7,
		height = 0.7,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

require("mason").setup(opts)
