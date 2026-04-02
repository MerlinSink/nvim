require("venv-selector").setup({
	options = {
		notify_user_on_venv_activation = true,
	},
})

SinkVim.keymap("n", "<leader>cv", "<CMD>:VenvSelect<CR>", "Select VirtualEnv")
-- require("plugins.dap")
