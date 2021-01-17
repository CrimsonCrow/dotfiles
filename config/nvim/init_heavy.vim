call plug#begin(stdpath('config') . '/plugged')

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerd
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" sane buffer
Plug 'moll/vim-bbye'

" autoformat
Plug 'Chiel92/vim-autoformat'

" icons
Plug 'ryanoasis/vim-devicons'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" auto-complete quotes, parens, brackets, etc.
Plug 'raimondi/delimitmate'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"jellybeans
Plug 'nanotech/jellybeans.vim'

" supertab
Plug 'ervandew/supertab'

" multi-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" General
set history=500

filetype plugin on
filetype indent on

set autoread
au FocusGained,BufEnter * checktime

" UI
set number relativenumber
set nowrap
set so=13

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set ruler
set hid
set backspace=eol,start,indent

set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Colors and Fonts
syntax on
colorscheme jellybeans

set encoding=utf8
set ffs=unix,dos,mac

" Files
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set autoindent
set smartindent

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" status line
" set laststatus=2
set noshowmode

" custom key bindings
let mapleader = " "
let maplocalleader = "\\"

"split navigations
nnoremap <space>wj <C-W><C-J>
nnoremap <space>wk <C-W><C-K>
nnoremap <space>wl <C-W><C-L>
nnoremap <space>wh <C-W><C-H>

" resize window width
nnoremap <space>w, <C-w><
nnoremap <space>w. <C-w>>

" resize window height
nnoremap <space>wm <C-w>+
nnoremap <space>w/ <C-w>-

" window splitting
nnoremap <space>wV :vsplit<cr>
nnoremap <space>wH :split<cr>

" buffer navigations
nnoremap <space>bk :bNext<cr>
nnoremap <space>bj :bprevious<cr>
nnoremap <space>bd :Bdelete<cr>
nnoremap <space>bw :Bwipeout<cr>

nnoremap <localleader>\ :CtrlPBuffer<cr>
nnoremap <space><space> :CtrlP<cr>

" delete all other buffers
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap <space>bO :BufOnly<cr>


" create a new file
"map <space>ff :e<space>

"clears highlights
nnoremap <esc><esc><esc> :noh<return>

" nerdtree bindings
nmap <space>op :NERDTreeToggle<cr>
let g:NERDTreeGitStatusWithFlags = 1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" autoformat
noremap <space>cf :Autoformat<CR>
noremap <space>cr :RemoveTrailingSpaces<cr>

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
