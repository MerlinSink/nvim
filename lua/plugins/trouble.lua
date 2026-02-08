local opts = {
	modes = {
		lsp = {
			win = { position = "right" },
		},
	},
}
require("trouble").setup(opts)

SinkVim.keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)")
SinkVim.keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)")
SinkVim.keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", "Symbols (Trouble)")
SinkVim.keymap("n", "<leader>cS", "<cmd>Trouble lsp toggle<cr>", "LSP references/definitions/... (Trouble)")
SinkVim.keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)")
SinkVim.keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)")
SinkVim.keymap("n", "[q", function()
	if require("trouble").is_open() then
		require("trouble").prev({ skip_groups = true, jump = true })
	else
		local ok, err = pcall(vim.cmd.cprev)
		if not ok then
			vim.notify(err, vim.log.levels.ERROR)
		end
	end
end, "Previous Trouble/Quickfix Item")
SinkVim.keymap("n", "]q", function()
	if require("trouble").is_open() then
		require("trouble").next({ skip_groups = true, jump = true })
	else
		local ok, err = pcall(vim.cmd.cnext)
		if not ok then
			vim.notify(err, vim.log.levels.ERROR)
		end
	end
end, "Next Trouble/Quickfix Item")
