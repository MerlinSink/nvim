local o = vim.o
local g = vim.g
local opt = vim.opt

g.mapleader = " " -- Global leader key
g.maplocalleader = "\\" -- Local leader key
g.markdown_recommended_style = 0 -- Fix markdown indentation
o.winborder = "rounded" -- Window border style: none, single, double, rounded, solid, shadow

opt.encoding = "UTF-8" -- Set encoding
opt.fileencoding = "UTF-8" -- Set file encoding

opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers

opt.cursorline = true -- Highlight current line
opt.showmatch = true -- Highlight matching brackets

opt.colorcolumn = "" -- Show column at 100 characters
opt.signcolumn = "yes" -- Always show sign column
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- Keep 10 columns left/right of cursor

opt.cmdheight = 1 -- Single line command line
opt.showmode = false -- Don't show mode in command line
opt.laststatus = 3 -- Global statusline
opt.ruler = false -- Disable default ruler
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Floating window transparency
opt.winminwidth = 5 -- Minimum window width
opt.list = false -- Show invisible characters

opt.fillchars = { -- Characters for UI elements
	eob = " ", -- Hide "~" on empty lines
	foldopen = "", -- Open fold indicator
	foldclose = "", -- Closed fold indicator
	fold = " ", -- Fold fill character
	foldsep = " ", -- Fold separator
	diff = "╱", -- Diff separator
}

opt.tabstop = 2 -- Tab width in spaces
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indent
opt.autoindent = true -- Copy indent from current line
opt.shiftround = true -- Round indent to multiple of shiftwidth

opt.wrap = false -- Do not wrap lines by default
opt.linebreak = true -- Wrap lines at convenient points

opt.selection = "inclusive" -- Include last char in selection
opt.virtualedit = "block" -- Allow cursor beyond text in visual block
opt.iskeyword:append("-") -- Include "-" in words

opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.mouse = "a" -- Enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard, disable in SSH
opt.modifiable = true -- Allow buffer modifications

opt.autochdir = false -- Do not auto-change directory
opt.autoread = true -- Auto-reload changes from outside (自动重新加载外部更改)
opt.autowrite = false -- Disable auto write

opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in query
opt.hlsearch = true -- Highlight search matches
opt.incsearch = true -- Show matches as you type
opt.path:append("**") -- Include subdirectories in search

opt.completeopt = "menu,menuone,noselect" -- Completion options
opt.wildmenu = true -- Tab completion in command line
opt.wildmode = "longest:full,full" -- Completion mode: longest match then full

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.SinkVim.fold.foldexpr()"
opt.foldlevel = 99
opt.foldtext = "v:lua.SinkVim.fold.foldtext()"

opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 50 -- Key code timeout

opt.synmaxcol = 300 -- Syntax highlighting limit
opt.redrawtime = 10000 -- Increase redraw tolerance
opt.maxmempattern = 20000 -- Increase max memory for pattern matching)

opt.backup = false -- Do not create backup file)
opt.writebackup = false -- Do not write to backup file
opt.swapfile = false -- Do not create swapfile

opt.undofile = true -- Enable persistent undo
-- local undodir = vim.fn.expand("~/.vim/undodir")
-- if vim.fn.isdirectory(undodir) == 0 then  -- Create undodir if nonexistent
--   vim.fn.mkdir(undodir, "p")
-- end
-- opt.undodir = undodir          -- Set undo directory
opt.undolevels = 10000 -- Maximum undo levels

opt.hidden = true -- Allow hidden buffers
opt.confirm = true -- Confirm to save changes before exit

opt.signcolumn = "yes" -- Always show signcolumn for diagnostics/gitsigns

opt.pumheight = 10 -- Maximum entries in popup
opt.pumblend = 0 -- Popup transparency

opt.diffopt:append("linematch:60") -- Improve diff display
opt.spelllang = { "en" } -- Spell check language

opt.grepprg = "rg --vimgrep" -- Use ripgrep for grep
opt.grepformat = "%f:%l:%c:%m" -- Grep output format

opt.sessionoptions = { -- What to save in sessions
	"buffers", -- Open buffers
	"curdir", -- Current directory
	"tabpages", -- Tab pages
	"winsize", -- Window sizes
	"help", -- Help windows
	"globals", -- Global variables
	"skiprtp", -- Skip runtimepath
	"folds", -- Fold states
}

opt.formatexpr = "" -- Disable default format expression
opt.formatoptions = "jcroqlnt" -- Auto-format options

opt.inccommand = "nosplit" -- Preview incremental substitute
opt.jumpoptions = "view" -- Preserve view when jumping

opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen" -- Keep text on screen when splitting

opt.smoothscroll = true -- Smooth scrolling (平滑滚动)

opt.conceallevel = 0 -- Do not hide markup
opt.concealcursor = "" -- Do not hide cursorline in markup

opt.termguicolors = true -- True color support

-- Shell configuration based on OS (根据操作系统配置 Shell)
-- if SinkVim.check_sys("Linux") then
--   opt.shell = "fish"
-- elseif SinkVim.check_sys("Windows") then
--   opt.shell = "pwsh"
--   opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
--   opt.shellquote = ""
--   opt.shellxquote = ""
-- end

if g.neovide then
	o.guifont = "JetBrainsMono Nerd Font Mono:h14:b"
	g.neovide_cursor_vfx_mode = "railgun"
	g.neovide_fullscreen = false
	g.neovide_opacity = 0.9
	g.neovide_scale_factor = 1.0
end
