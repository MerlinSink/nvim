local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Set <LEADER> as <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nohlsearch
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opts)
-- Reload init.lua
map("n", "<C-n>", ":source $MYVIMRC<CR>", opts)

-- Save & quit
map("n", "Q", ":q<CR>", opts)
-- noremap <C-q> :qa<CR>
map("n", "W", ":w<CR>", opts)

-- Move Normal
map("n", "J", "5j", opts)
map("n", "K", "5k", opts)
map("n", "H", "5h", opts)
map("n", "L", "5l", opts)
-- Move Visual
map("v", "J", "5j", opts)
map("v", "K", "5k", opts)
map("v", "H", "5h", opts)
map("v", "L", "5l", opts)

-- Open lazygit
map("n", "<C-g>", ":tabe<CR>:-tabmove<CR>:term lazygit<CR> i", opts)

-- Split
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opts)
map("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", opts)

-- Change Split
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "su", "<C-w>t<C-w>H", opts)
map("n", "si", "<C-w>t<C-w>K", opts)

-- Change Size
map("n", "<UP>", ":resize +5<CR>", opts)
map("n", "<DOWN>", ":resize -5<CR>", opts)
map("n", "<LEFT>", ":vertical resize +5<CR>", opts)
map("n", "<RIGHT>", ":vertical resize -5<CR>", opts)

-- Create a tab and move
map("n", "tj", ":tabe<CR>", opts)
-- map("n", "th", ":-tabnext<CR>", opts)
-- map("n", "tl", ":+tabnext<CR>", opts)

-- === PluginKeys ===

local pluginKeys = {}

-- === Nvim-Tree === 
map("n", "<LEADER>e", ":NvimTreeToggle<CR>", opts)

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
map("n", "E", ":BufferLineCyclePrev<CR>", opts)
map("n", "R", ":BufferLineCycleNext<CR>", opts)
-- 关闭
--"moll/vim-bbye"
map("n", "tw", ":Bdelete!<CR>", opts)
map("n", "<LEADER>bl", ":BufferLineCloseRight<CR>", opts)
map("n", "<LEADER>bh", ":BufferLineCloseLeft<CR>", opts)
map("n", "<LEADER>bc", ":BufferLinePickClose<CR>", opts)

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
      o = { "[[", "]]"},
      c = { "{", "}" },
      a = { "<", ">" }
}
pluginKeys.linearList = {
      q = { "'", "'" },
      g = { "`", "`" },
      d = { '"', '"' },
      i = { "*", "*" },
      I = { "**", "**" },
      u = { "$", "$" },
}

-- === Telescope ===
map("n", "<LEADER>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- map("n", "<LEADER>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- Globle Search
map("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- old file
map("n", "<LEADER>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
-- buffer
map("n", "<LEADER>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- buffer_fuzzy
map("n", "<LEADER>fs", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
-- map("n", "<", "Telescope current_buffer_fuzzy_find<CR>", opts)
-- dap
map("n", "<LEADER>fd", "<cmd>lua require'telescope'.extensions.dap.configurations(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)

pluginKeys.telescopeList = {
	n = {
		-- close window
    ["<LEADER>c"] = "close",
	},
  i = {
    -- Move UP&DOWN
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- History
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- close window
    ["<LEADER>c"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- === markdown-preview ===
map("n", "<LEADER>md", "<cmd>MarkdownPreviewToggle<CR>", opts)

-- === picgo ===
-- map("n", "<LEADER>pcc", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>", opts)
-- map("n", "<LEADER>pci", "<cmd>lua require'nvim-picgo'.upload_imagefile()<cr>", opts)
--
-- === vim-visual-multi ===
vim.cmd[[
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
let g:VM_maps['Remove Region']      = ''
let g:VM_maps['Skip Region']        = 'p'
let g:VM_maps['Remove Region']      = 'd'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'
]]

-- === gitsigns ===

-- === LSP ===
-- pluginKeys.mapLSP = function (lsp_keymaps(bufnr))
--  map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--  map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--  map(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--  map(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--  map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--  map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--  map(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
--  map(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
--  map(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
--  map(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--  map(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
--  map(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
--  map(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
--  map(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--  map(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- end

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

-- === null-ls ===
-- -- map("n", "<LEADER>n", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- === sniprun ===
map("n", "<LEADER>rf", ":%SnipRun<CR>", opts)
map("v", "<LEADER>rs", ":%SnipRun<CR>", opts)

-- === Transparent
map("n", "<LEADER>'t", ":TransparentToggle<CR>", opts)

-- === debugger ===
-- debugger
-- map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'dap.dap-util'.store_breakpoints(true)<cr>", opts)
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- map("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- map('n', '<F10>', '<cmd>lua require"dap.dap-util".reload_continue()<CR>', opts)
map("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- map("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- map("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- === dap-ui ===
pluginKeys.dapui = {

    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",

}

return pluginKeys
