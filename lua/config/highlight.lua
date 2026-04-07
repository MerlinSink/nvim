local highlights = {
	-- RainbowRed = { fg = "#FF757F" },
	-- RainbowYellow = { fg = "#FFC777" },
	-- RainbowBlue = { fg = "#82AAFF" },
	-- RainbowOrange = { fg = "#FF966C" },
	-- RainbowGreen = { fg = "#C3E88D" },
	-- RainbowViolet = { fg = "#FCA7EA" },
	-- RainbowCyan = { fg = "#86E1FC" },

	FoldIcon = { fg = "#EED49F" },
	FoldText = { bg = "#EED49F", fg = "#24273A" },
}

for name, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, name, opts)
end
