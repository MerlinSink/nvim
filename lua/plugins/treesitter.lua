local opts = {
	ensure_installed = {
        "astro",
		"c",
		"cpp",
		"lua",
		"python",
		"bash",
		"json",
		"vim",
		"vimdoc",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

require("nvim-treesitter").setup(opts)
