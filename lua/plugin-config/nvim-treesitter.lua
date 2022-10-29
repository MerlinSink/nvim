local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("No found nvim-treesitter")
    return
end

treesitter.setup({
  ensure_installed = {
		"c", "cpp", "python", "lua", "html", "css", "markdown", "json", "vim", "bash"
	},
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
