return {
	"sainnhe/everforest",
	lazy = false,
	config = function()
		-- directly inside the plugin declaration.
		vim.g.everforest_enable_italic = true
		-- " Available values: 'hard', 'medium'(default), 'soft'
    vim.g.everforest_background = "soft"
		-- " For better performance
    vim.g.erverforest_better_performance = 1
	end,
}
