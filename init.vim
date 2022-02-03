" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|




" ====================
" === Editor Setup ===
" ====================

" ======
" System
" ======

" ===============
" Editor Behavior
" ===============
set exrc
set secure
set number
set relativenumber
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

" ==============
" Basic Mappings
" ==============
" Set <LEADER> as <SPACE>
let mapleader=" "

" Nohlsearch
noremap <LEADER><CR> :nohlsearch<CR>
" Reload vimrc
map <C-n> :source $MYVIMRC<CR>

" Save & quit
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap W :w<CR>

" Move
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

" Open lazygit
noremap <C-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR> i

" Split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

" Change Split
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

map su <C-w>t<C-w>H
map si <C-w>t<C-w>K

" Change Size
map <UP> :resize +5<CR>
map <DOWN> :resize -5<CR>
map <LEFT> :vertical resize +5<CR>
map <RIGHT> :vertical resize -5<CR>

" Create a tab and move 
map tj :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" ==============================
" Install Plugings with Vim-Plug
" ==============================

call plug#begin('$HOME/.config/nvim/plugged')

" NERDTree
Plug 'preservim/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Pretty Dress
"Plug 'theniceboy/nvim-deus'
"Plug 'joshdick/onedark.vim'
Plug 'connorholyday/vim-snazzy'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" ===============
" Dress up my vim
" ===============
"set termguicolors " enable true colors support
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark

" ===deus===
"color deus

" ===OneDark===
"color onedark

" ===Snazzy===
color snazzy
let g:SnazzyTransparent = 1

" ===Airline===
let g:airline_theme='onedark'

" ===================== Start of Plugin Settings =====================

" ================
" Markdown Preview
" ================

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
