local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Nohlsearch
keymap("n", "<LEADER><CR>", ":nohlsearch<CR>", opts)
-- Reload init.lua
-- keymap("n", "<C-n>", ":source $MYVIMRC<CR>", opts)

-- Save & quit
keymap("n", "Q", ":q<CR>", opts)
-- noremap <C-q> :qa<CR>
keymap("n", "W", ":w<CR>", opts)

-- Move Normal
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "H", "5h", opts)
keymap("n", "L", "5l", opts)
-- Move Visual
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "H", "5h", opts)
keymap("v", "L", "5l", opts)

-- Open lazygit
keymap("n", "<C-g>", ":tabe<CR>:-tabmove<CR>:term lazygit<CR> i", opts)

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
keymap("n", "tj", ":tabe<CR>", opts)
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)
--
-- lazy.nvim
keymap("n", "<leader>ol", "<Cmd>Lazy<Cr>", opts)
-- Mason
keymap("n", "<leader>om", "<Cmd>Mason<Cr>", opts)
-- Conform
keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", opts)
