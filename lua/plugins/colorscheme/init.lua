vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/sainnhe/everforest" },
})

require("plugins.colorscheme.tokyonight")
require("plugins.colorscheme.catppuccin")
require("plugins.colorscheme.everforest")

local path = vim.fn.stdpath("config") .. "/lua/config/setting.json"
local settings = SinkVim.json.read(path)
if settings and settings.colorscheme then
	vim.cmd("colorscheme " .. settings.colorscheme)
end
