return {
	"sainnhe/gruvbox-material",
	lazy = true,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
    vim.o.background = "light"
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_background = "hard"
	end,
}
