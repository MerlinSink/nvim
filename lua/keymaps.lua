local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Set <LEADER> as <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nohlsearch
keymap("n", "<LEADER><CR>", ":nohlsearch<CR>", opts)
-- Reload init.lua
keymap("n", "<C-n>", ":source $MYVIMRC<CR>", opts)

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
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
keymap("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opts)
keymap("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>", opts)

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

-- === PluginKeys ===

local pluginKeys = {}

-- === Nvim-Tree === 
keymap("n", "<LEADER>e", ":NvimTreeToggle<CR>", opts)

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
keymap("n", "E", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "R", ":BufferLineCycleNext<CR>", opts)
-- 关闭
--"moll/vim-bbye"
keymap("n", "tw", ":Bdelete!<CR>", opts)
keymap("n", "<LEADER>bl", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<LEADER>bh", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<LEADER>bc", ":BufferLinePickClose<CR>", opts)

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
keymap("n", "<LEADER>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- map("n", "<LEADER>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- Globle Search
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- old file
keymap("n", "<LEADER>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
-- buffer
keymap("n", "<LEADER>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- buffer_fuzzy
keymap("n", "<LEADER>fs", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
-- map("n", "<", "Telescope current_buffer_fuzzy_find<CR>", opts)
-- dap
keymap("n", "<LEADER>fd", "<cmd>lua require'telescope'.extensions.dap.configurations(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
-- todo-comment
keymap("n", "<LEADER>ft", "<cmd>TodoTelescope<CR>", opts)

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

-- === symbols-outline ===
pluginKeys.symbols_outline = {
    -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "p",
    rename_symbol = "r",
    code_actions = "a",
    fold = "u",
    unfold = "i",
    fold_all = "U",
    unfold_all = "I",
    fold_reset = "R",
}
keymap("n", "<LEADER>n", "<cmd>SymbolsOutline<CR>", opts)

-- === aerial ===
keymap("n", "<LEADER>a", "<cmd>AerialToggle<CR>", opts)
keymap("n", "{", "<cmd>AerialPrev<CR>", opts)
keymap("n", "}", "<cmd>AerialNext<CR>", opts)

-- === markdown-preview ===
keymap("n", "<LEADER>md", "<cmd>MarkdownPreviewToggle<CR>", opts)

-- === picgo ===
-- map("n", "<LEADER>pcc", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>", opts)
-- map("n", "<LEADER>pci", "<cmd>lua require'nvim-picgo'.upload_imagefile()<cr>", opts)

-- === vim-visual-multi ===
vim.cmd[[
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n
let g:VM_maps['Remove Region']      = ''
let g:VM_maps['Skip Region']        = 's'
let g:VM_maps['Remove Region']      = 'r'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'
]]

-- === leap.nvim ===
vim.keymap.set({'x', 'o', 'n'}, '<LEADER>s', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, '<LEADER>S', '<Plug>(leap-backward-to)')

-- === gitsigns ===

-- === LSP ===
-- pluginKeys.lsp_keymaps = function (bufnr)
-- 	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	keymap(bufnr, "n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- 	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	-- keymap(bufnr, "n", "gd", "<cmd>Lspsaga preview_definition()<CR>", opts)
-- 	-- keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	keymap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
-- 	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	keymap(bufnr, "n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- 	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lm", "<cmd>Mason<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
-- 	-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
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

	      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {"i", "s"}),
        }
end

-- === null-ls ===
-- -- keymap("n", "<LEADER>n", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- === sniprun ===
keymap("n", "<LEADER>rf", ":%SnipRun<CR>", opts)
keymap("v", "<LEADER>rs", ":%SnipRun<CR>", opts)

-- === Transparent
keymap("n", "<LEADER>'t", ":TransparentToggle<CR>", opts)

-- === debugger ===
-- debugger
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'dap.dap-util'.store_breakpoints(true)<cr>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap('n', '<F10>', '<cmd>lua require"dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

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
