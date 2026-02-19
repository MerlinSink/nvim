local opts = {
	explorer = { enabled = true },
	dashboard = { enabled = false },
	indent = {
		enabled = true,
		scope = {
			enabled = true, -- enable highlighting the current scope
			hl = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		},
	},
	notifier = { enabled = true },
	picker = { enabled = true },
	scroll = { enabled = true },
	terminal = { enabled = true, win = { style = "terminal" } },
}

require("snacks").setup(opts)
