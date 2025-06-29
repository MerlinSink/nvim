local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

local modules = {
	"options",
	"keymaps",
	"highlights",
	"autocmds",
	"lazy",
}

_G.Util = require("config.util")
_G.icons = require("config.icons")

for _, module in ipairs(modules) do
	load("config." .. module)
end

vim.cmd([[colorscheme gruvbox-material]])
