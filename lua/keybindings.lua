local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- Set <LEADER> as <SPACE>
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Nohlsearch
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)
-- Reload vimrc
map("n", "<C-n>", ":source $MYVIMRC<CR>", opt)

-- Save & quit
map("n", "Q", ":q<CR>", opt)
-- noremap <C-q> :qa<CR>
map("n", "W", ":w<CR>", opt)

-- Move
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "H", "5h", opt)
map("n", "L", "5l", opt)

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
-- map("n", "tj", ":tabe<CR>", opt)
-- map("n", "th", ":-tabnext<CR>", opt)
-- map("n", "tl", ":+tabnext<CR>", opt)

-- === PluginKeys ===

local pluginKeys = {}

-- === Nvim-Tree === 
map("n", "tt", ":NvimTreeToggle<CR>", opt)
-- Shotcut key
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
map("n", "th", ":BufferLineCyclePrev<CR>", opt)
map("n", "tl", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "tw", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- === LSP ===
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

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
