call plug#begin(stdpath('config') . '/plugged')

" Colorscheme
" Plug 'joshdick/onedark.vim'
" Better syntax highlighting
Plug 'sheerun/vim-polyglot'
" status line
Plug 'itchyny/lightline.vim'
" auto-complete quotes, parens, brackets, etc.
Plug 'raimondi/delimitmate'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" lightline config
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" General
set history=500

filetype plugin on
filetype indent on

set autoread
au FocusGained,BufEnter * checktime

" UI
set number relativenumber
set nowrap
"set so=10

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set ruler
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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
colorscheme onedark

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
set laststatus=2
set noshowmode

" mouse support
set mouse=a
