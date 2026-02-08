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
	"highlights",
	"autocmds",
	"lsp",
}

for _, module in ipairs(modules) do
	load("config." .. module)
end

-- Set Colorscheme
require("plugins.Colorscheme.tokyonight")
require("plugins.Colorscheme.catppuccin")

local path = vim.fn.stdpath("config") .. "/lua/config/setting.json"
local settings = SinkVim.json.read(path)
if settings and settings.colorscheme then
	vim.cmd("colorscheme " .. settings.colorscheme)
end

-- === Setup Plugins ===
-- Snacks
require("plugins.Sancks")

-- Butterline & lualine & gitsigns
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.gitsigns")

-- mason & Conform & blink.cmp
require("plugins.mason")
require("plugins.conform")
require("plugins.blink")

-- flash & noice & which-key
require("plugins.noice")
require("plugins.trouble")
require("plugins.which-key")

-- multicursor
require("plugins.multicursor")

-- oil & mini
require("plugins.oil")
require("plugins.mini")

-- treesitter & luasnip
require("plugins.treesitter")
require("plugins.luasnip")

-- lazydev
require("lazydev").setup({
	library = {
		-- See the configuration section for more details
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "snacks.nvim", words = { "Snacks" } },
	},
})
