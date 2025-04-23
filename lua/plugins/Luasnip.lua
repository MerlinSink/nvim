return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = "make install_jsregexp",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
			end,
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	config = function()
		require("luasnip").config.set_config({
			enable_autosnippets = true,
			store_selection_keys = "`",
		})
		local load = require("luasnip.loaders.from_lua").load
		if vim.fn.has("unix") == 1 then
			load(vim.fn.expand("$HOME/.config/nvim/Snippets"))
		elseif vim.fn.has("win32") == 1 then
			load(vim.fn.expand("~/AppData/Local/nvim/Snippets"))
		end
		local auto_expand = require("luasnip").expand_auto
		require("luasnip").expand_auto = function(...)
			vim.o.undolevels = vim.o.undolevels
			auto_expand(...)
		end
	end,
}
