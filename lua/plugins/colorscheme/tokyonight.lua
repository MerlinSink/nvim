local opts = {
	style = "moon",
	light_style = "day",
	transparent = false,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "normal",
		floats = "normal",
	},
}

require("tokyonight").setup(opts)
