local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

_G.SinkVim = require("util")

local modules = {
	"options",
	"pack",
	"keymaps",
	"autocmds",
	"lsp",
}

for _, module in ipairs(modules) do
	load("config." .. module)
end

require("plugins.colorscheme")
require("plugins.Sancks")
require("plugins.mini")
require("plugins.LuaSnip")
require("plugins.mason")

-- === Setup Plugins ===
require("plugins.render-markdown")

-- lazydev
require("lazydev").setup({
	library = {
		-- See the configuration section for more details
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "snacks.nvim", words = { "Snacks" } },
	},
})
