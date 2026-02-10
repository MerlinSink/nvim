local venv_slector_opts = {
	options = {
		notify_user_on_venv_activation = true,
	},
}
SinkVim.keymap("n", "<leader>cv", "<CMD>:VenvSelect<CR>", "Select VirtualEnv")

require("venv-selector").setup(venv_slector_opts)
require("plugins.dap")
