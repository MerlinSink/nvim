local opts = {
	explorer = { enabled = false },
	dashboard = { enabled = false },
	indent = {
		enabled = true,
		scope = {
			enabled = true, -- enable highlighting the current scope
			hl = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			},
		},
	},
	notifier = { enabled = true },
	picker = { enabled = true },
	scroll = { enabled = true },
}

require("snacks").setup(opts)
