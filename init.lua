local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

-- Set RuntimePath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("config.util").lazy_file()

local modules = {
	"config.options",
	"config.keymaps",
	"config.highlights",
	"config.autocmds",
	"config.lazy",
}

for _, module in ipairs(modules) do
	load(module)
end

vim.cmd([[colorscheme tokyonight]])
