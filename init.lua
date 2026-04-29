local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

_G.SinkVim = require("util")
require("plugins.colorscheme")

local modules = {
	"options",
	"pack",
	"keymaps",
	"highlight",
	"autocmds",
	"lsp",
}

for _, module in ipairs(modules) do
	load("config." .. module)
end

-- lazydev
require("lazydev").setup({
	library = {
		-- See the configuration section for more details
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "snacks.nvim", words = { "Snacks" } },
	},
})
