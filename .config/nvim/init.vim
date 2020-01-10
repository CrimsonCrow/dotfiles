" vim-plug
call plug#begin()
" Auto-completion for quotes, parens, bracket, etc.
Plug 'raimondi/delimitmate'
" Vim syntax highlighting, solid language pack for vim
Plug 'sheerun/vim-polyglot'
" VIm-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Tmuxline
Plug 'edkolev/tmuxline.vim'
" Automatic resizing for vim windows to golden ratio
Plug 'roman/golden-ratio'
" Code completion engine for vim
Plug 'ycm-core/youcompleteme'
" deus colorscheme
Plug 'ajmwagar/vim-deus'
call plug#end()

set exrc
set secure
filetype plugin indent on
syntax enable
set number
set splitbelow
set splitright
set shiftwidth=4
set softtabstop=4
set nowrap
set smarttab
set expandtab

set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

" Vim keys remapping
" Tab bindings
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tH :tabfirst<CR>
nnoremap tL :tablast<CR>

" Window management
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l

" vim-airline config
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1

" golden ratio config
let g:golden_ratio_exclude_nonmodifiable = 1
