return {
	"uga-rosa/ccc.nvim",
	event = "LazyFile",
	keys = {
		{ "<leader>uH", "<Cmd>CccHighlighterToggle<CR>", desc = "CccHighlighter Toggle" },
		{ "<leader>th", "<Cmd>CccConvert<CR>", desc = "CccHighlighter Convert" },
		{ "<leader>Hp", "<Cmd>CccPick<CR>", desc = "CccHighlighter Pick" },
	},
	opts = {
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	},
}
