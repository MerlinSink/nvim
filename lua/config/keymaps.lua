local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Nohlsearch
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Move Visual
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "H", "5h", opts)
keymap("v", "L", "5l", opts)

-- Split
keymap("n", "<leader>sl", ":set splitright<CR>:vsplit<CR>", opts)
keymap("n", "<leader>sh", ":set nosplitright<CR>:vsplit<CR>", opts)
keymap("n", "<leader>sj", ":set splitbelow<CR>:split<CR>", opts)
keymap("n", "<leader>sk", ":set nosplitbelow<CR>:split<CR>", opts)

-- Change Split
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "su", "<C-w>t<C-w>H", opts)
keymap("n", "si", "<C-w>t<C-w>K", opts)

-- Change Size
keymap("n", "<UP>", ":resize +5<CR>", opts)
keymap("n", "<DOWN>", ":resize -5<CR>", opts)
keymap("n", "<LEFT>", ":vertical resize +5<CR>", opts)
keymap("n", "<RIGHT>", ":vertical resize -5<CR>", opts)

-- Create a tab and move
keymap("n", "nt", ":tabe<CR>", opts)
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)

-- lazy.nvim
keymap("n", "<leader>ol", "<Cmd>Lazy<Cr>", opts)
-- Conform
keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", opts)
