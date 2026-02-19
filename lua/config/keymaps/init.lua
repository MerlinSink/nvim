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

-- Split
SinkVim.keymap("n", "<C-j>", "<C-w>j", "Go to the down window")
SinkVim.keymap("n", "<C-k>", "<C-w>k", "Go to the up window")
SinkVim.keymap("n", "<C-h>", "<C-w>h", "Go to the left window")
SinkVim.keymap("n", "<C-l>", "<C-w>l", "Go to the right window")
SinkVim.keymap("n", "<leader><C-j>", "<CMD>split<CR>", "Split Down")
SinkVim.keymap("n", "<leader><C-k>", "<CMD>aboveleft split<CR>", "Split Up")
SinkVim.keymap("n", "<leader><C-h>", "<CMD>belowright vsplit<CR>", "Split Left")
SinkVim.keymap("n", "<leader><C-l>", "<CMD>vsplit<CR>", "Split Right")
SinkVim.keymap("n", "<leader><C-x>", "<C-w>c", "Close The Current Window")
SinkVim.keymap("n", "<leader><C-o>", "<C-w>o", "Close The Other Windows")
SinkVim.keymap("n", "<leader><C-v>", "<C-w>t<C-w>H", "Split to vertical")
SinkVim.keymap("n", "<leader><C-h>", "<C-w>t<C-w>K", "Split to horizontal")

-- Create a tab and move
SinkVim.keymap("n", "nt", vim.cmd.tabnew, "New Tab")
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)

-- grug-far
SinkVim.keymap({ "n", "x" }, "<leader>sr", function()
	local grug = require("grug-far")
	local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= "" and "*." .. ext or nil,
		},
	})
end, "Search and Replace")

-- tmux
SinkVim.keymap("n", "<C-h>", "<CMD><C-U>TmuxNavigateLeft<CR>", "TmuxNavigateLeft")
SinkVim.keymap("n", "<C-j>", "<CMD><C-U>TmuxNavigateDown<CR>", "TmuxNavigateDown")
SinkVim.keymap("n", "<C-k>", "<CMD><C-U>TmuxNavigateUp<CR>", "TmuxNavigateUp")
SinkVim.keymap("n", "<C-l>", "<CMD><C-U>TmuxNavigateRight<CR>", "TmuxNavigateRight")
SinkVim.keymap("n", "<C-\\>", "<CMD><C-U>TmuxNavigatePrevious<CR>", "TmuxNavigatePrevious")

for _, file in ipairs(files) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	if name ~= "init" then
		require("config.keymaps." .. name)
	end
end
