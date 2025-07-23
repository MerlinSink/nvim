local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

_G.SinkVim = require("util")

local modules = {
	"options",
	"keymaps",
	"highlights",
	"autocmds",
	"lsp",
	"lazy",
}

for _, module in ipairs(modules) do
	load("config." .. module)
end

local path = vim.fn.stdpath("config") .. "/lua/config/setting.json"
local settings = SinkVim.json.read(path)
if settings and settings.colorscheme then
	vim.cmd("colorscheme " .. settings.colorscheme)
end
