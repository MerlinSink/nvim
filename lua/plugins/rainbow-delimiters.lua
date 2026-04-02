require("rainbow-delimiters.setup").setup({
	strategy = {
		[""] = require("rainbow-delimiters").strategy["global"],
		vim = require("rainbow-delimiters").strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
	condition = function(bufnr)
		local ft = vim.bo[bufnr].filetype
		local skip_patterns = {
			"snacks",
			"noice",
			"nui",
			"notify",
			"Telescope",
			"neo%-tree",
			"lazy",
			"mason",
		}
		for _, pattern in ipairs(skip_patterns) do
			if ft:match(pattern) then
				return false
			end
		end
		local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
		return ok and parser ~= nil
	end,
})
