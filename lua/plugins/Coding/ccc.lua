return {
	"uga-rosa/ccc.nvim",
	event = "LazyFile",
	keys = {
		{ "<leader>th", "<Cmd>CccConvert<CR>", desc = "CccHighlighter Convert" },
		{ "<leader>Hp", "<Cmd>CccPick<CR>", desc = "CccHighlighter Pick" },
	},
	opts = {
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	},
	config = function(_, opts)
		require("ccc").setup(opts)
		Snacks.toggle({
			name = "Ccc Highlighter Toggle",
			get = function()
				return require("ccc.highlighter").attached_buffer[vim.api.nvim_get_current_buf()]
			end,
			set = function(enabled)
				local m = require("ccc.highlighter")
				if enabled then
          m:enable(0)
				else
					m:disable(0)
				end
			end,
		}):map("<leader>uH")
	end,
}
