return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = require("plugins.Snacks.keymaps").key,
	init = require("plugins.Snacks.keymaps").toggle,
	config = function()
		local modules = {
			"animate",
			"bigfile",
			"dashboard",
			"explorer",
			"indent",
			"image",
			"input",
			"notifier",
			"picker",
			"quickfile",
			"scope",
			"scroll",
			"statuscolumn",
			"styles",
			"terminal",
			"win",
			"words",
		}

		local conf = SinkVim.load("plugins.Snacks.", modules)
		require("snacks").setup(conf)
	end,
}
