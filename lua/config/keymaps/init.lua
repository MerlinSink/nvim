local dir = vim.fn.stdpath("config") .. "/lua/config/keymaps"
local files = vim.fn.globpath(dir, "*.lua", false, true)

-- === Defult Setting ===
-- Nohlsearch
SinkVim.keymap("n", "<Esc>", vim.cmd.nohlsearch, "Nohlsearch")

-- Save & Quit
SinkVim.keymap("n", "<leader>W", vim.cmd.write, "Save")
SinkVim.keymap("n", "<leader>Q", vim.cmd.quit, "Quit")

-- source config & restart
SinkVim.keymap("n", "<leader>rl", "<Cmd>source %<CR>", "Source config")
SinkVim.keymap("n", "<leader>rs", "<Cmd>restart<CR>", "Restart NeoVim")

-- Change Split
SinkVim.keymap("n", "<C-j>", "<C-w>j", "Go to the down window")
SinkVim.keymap("n", "<C-k>", "<C-w>k", "Go to the up window")
SinkVim.keymap("n", "<C-h>", "<C-w>h", "Go to the left window")
SinkVim.keymap("n", "<C-l>", "<C-w>l", "Go to the right window")

SinkVim.keymap("n", "<leader>cu", "<C-w>t<C-w>H", "Split to vertical")
SinkVim.keymap("n", "<leader>ci", "<C-w>t<C-w>K", "Split to horizontal")

-- Create a tab and move
SinkVim.keymap("n", "nt", vim.cmd.tabnew, "New Tab")
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)

for _, file in ipairs(files) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	if name ~= "init" then
		require("config.keymaps." .. name)
	end
end

