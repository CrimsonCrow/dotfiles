call plug#begin('~/.vim/plugged')
" vim-color-forest-night
Plug 'sainnhe/vim-color-forest-night'
" Auto-completion for quotes, parens, bracket, etc.
Plug 'raimondi/delimitmate'
" Vim syntax highlighting, solid language pack for vim
Plug 'sheerun/vim-polyglot'
" YouCompleteMe Code completion
Plug 'ycm-core/youcompleteme'
" YCM-Generator
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" VIm-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Tmuxline
Plug 'edkolev/tmuxline.vim'

" Automatic resizing for vim windows to golden ratio
Plug 'roman/golden-ratio'
call plug#end()

" syntax on
set number
set smartcase
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set cindent
set splitbelow
set splitright
set wrap

set t_Co=256

" Vim keys remapping
" Tab bindings
nnoremap tn :tabnew<Space>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tH :tabfirst<CR>
nnoremap tL :tablast<CR>

" Window management
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l

" Colorscheme
colorscheme forest-night

hi Normal guibg=NONE ctermbg=NONE
hi Visual ctermfg=NONE ctermbg=black
highlight EndOfBuffer ctermbg=NONE

" VIm-airline config
let g:airline_theme = 'forest_night'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
