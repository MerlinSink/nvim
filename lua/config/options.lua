local o = vim.o
local g = vim.g
local opt = vim.opt

-- This file is automatically loaded by plugins.core
g.mapleader = " "
g.maplocalleader = "\\"

g.autoformat = false
g.snacks_animate = true
g.lazyvim_picker = "auto"
g.lazyvim_cmp = "auto"
g.ai_cmp = true
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
g.root_lsp_ignore = { "copilot" }
g.deprecation_warnings = false
g.trouble_lualine = true

opt.encoding = "UTF-8"
opt.fileencoding = "utf-8"

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.smoothscroll = true
opt.foldexpr = "v:lua.SinkVim.fold.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = "v:lua.SinkVim.fold.foldtext()"

if SinkVim.check_sys("Linux") then
	opt.shell = "fish"
elseif SinkVim.check_sys("Windows") then
	opt.shell = "pwsh"
	opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
	opt.shellquote = ""
	opt.shellxquote = ""
end

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- Set winborder
-- o.winborder = "rounded" -- "none", "single", "double", "rounded", "solid", "shadow"

if g.neovide then
	o.guifont = "JetBrainsMono Nerd Font Mono:h14:b"
	g.neovide_cursor_vfx_mode = "railgun"
	g.neovide_fullscreen = false
	g.neovide_opacity = 0.9
	g.neovide_scale_factor = 1.0
end
