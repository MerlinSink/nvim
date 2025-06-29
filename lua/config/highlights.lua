local Rainbow = {
	RainbowRed = { fg = "#E06C75" },
	RainbowYellow = { fg = "#E5C07B" },
	RainbowBlue = { fg = "#61AFEF" },
	RainbowOrange = { fg = "#D19A66" },
	RainbowGreen = { fg = "#98C379" },
	RainbowViolet = { fg = "#C678DD" },
	RainbowCyan = { fg = "#56B6C2" },
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for group, colors in pairs(Rainbow) do
      vim.api.nvim_set_hl(0, group, colors)
    end
  end,
})
