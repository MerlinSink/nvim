local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Nohlsearch
keymap("n", "<Esc>", "<Cmd>nohlsearch<CR>", opts)

-- Save
keymap("n", "<leader>W", "<Cmd>w<CR>", opts)

-- Quit
keymap("n", "<leader>Q", "<Cmd>q<CR>", opts)

-- Move Visual
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "H", "5h", opts)
keymap("v", "L", "5l", opts)

-- Change Split
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "su", "<C-w>t<C-w>H", opts)
keymap("n", "si", "<C-w>t<C-w>K", opts)

-- Create a tab and move
keymap("n", "nt", ":tabe<CR>", opts)
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)

-- lazy.nvim
keymap("n", "<leader>lz", "<Cmd>Lazy<Cr>", opts)
-- Conform
keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", opts)
