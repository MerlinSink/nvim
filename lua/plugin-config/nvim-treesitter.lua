local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("No found nvim-treesitter")
    return
end

treesitter.setup({
  ensure_installed = { "c", "python", "lua", "markdown", "json" },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
	incremental_selection = {
		enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = "<TAB>",
			},
  },
})

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
