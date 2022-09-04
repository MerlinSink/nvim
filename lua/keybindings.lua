local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- Set <LEADER> as <SPACE>
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Nohlsearch
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)
-- Reload init.lua
map("n", "<C-n>", ":source $MYVIMRC<CR>", opt)

-- Save & quit
map("n", "Q", ":q<CR>", opt)
-- noremap <C-q> :qa<CR>
map("n", "W", ":w<CR>", opt)

-- Move Normal
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "H", "5h", opt)
map("n", "L", "5l", opt)
-- Move Visual
map("v", "J", "5j", opt)
map("v", "K", "5k", opt)
map("v", "H", "5h", opt)
map("v", "L", "5l", opt)

-- Open lazygit
map("n", "<C-g>", ":tabe<CR>:-tabmove<CR>:term lazygit<CR> i", opt)

-- Split
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opt)
map("n", "sj", ":set splitbelow<CR>:split<CR>", opt)
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", opt)

-- Change Split
map("n", "<LEADER>j", "<C-w>j", opt)
map("n", "<LEADER>k", "<C-w>k", opt)
map("n", "<LEADER>h", "<C-w>h", opt)
map("n", "<LEADER>l", "<C-w>l", opt)

map("n", "su", "<C-w>t<C-w>H", opt)
map("n", "si", "<C-w>t<C-w>K", opt)

-- Change Size
map("n", "<UP>", ":resize +5<CR>", opt)
map("n", "<DOWN>", ":resize -5<CR>", opt)
map("n", "<LEFT>", ":vertical resize +5<CR>", opt)
map("n", "<RIGHT>", ":vertical resize -5<CR>", opt)

-- Create a tab and move
map("n", "tj", ":tabe<CR>", opt)
-- map("n", "th", ":-tabnext<CR>", opt)
-- map("n", "tl", ":+tabnext<CR>", opt)

-- === PluginKeys ===

local pluginKeys = {}

-- === Nvim-Tree === 
map("n", "<LEADER>e", ":NvimTreeToggle<CR>", opt)

pluginKeys.nvimTreeList = {
	-- Open file or document
	{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- Show dotfiles
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- Operate
	{ key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- === Bufferline ===
map("n", "E", ":BufferLineCyclePrev<CR>", opt)
map("n", "R", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "tw", ":Bdelete!<CR>", opt)
map("n", "<LEADER>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<LEADER>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<LEADER>bc", ":BufferLinePickClose<CR>", opt)

-- === comment ===
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}

-- === sorround ===
pluginKeys.nestableList = {
      b = { "(", ")" },
      s = { "[", "]" },
      c = { "{", "}" },
      a = { "<", ">" }
}
pluginKeys.linearList = {
      q = { "'", "'" },
      t = { "`", "`" },
      d = { '"', '"' },
			i = { "*", "*" },
			I = { "**", "**" },
}

-- === Telescope ===
map("n", "<LEADER>f", ":Telescope find_files<CR>", opt)
-- Globle Search
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- old file
map("n", "<LEADER>o", ":Telescope oldfiles<CR>", opt)
-- map("n", "<LEADER>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opt)

pluginKeys.telescopeList = {
	i = {
    -- Move UP&DOWN
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- History
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<LEADER>c"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- === gitsigns ===

-- === LSP ===
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- diagnostic
  -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", opt)

  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- === cmp ===
pluginKeys.cmp = function(cmp)
    return {
       	-- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

return pluginKeys
