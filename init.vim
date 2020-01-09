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
" Vim plugin that use clang for completing C/C++ code
Plug 'rip-rip/clang_complete'
" Chained completion
Plug 'lifepillar/vim-mucomplete'
" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'
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
let g:airline_theme = 'fairyfloss'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" golden ratio config
let g:golden_ratio_exclude_nonmodifiable = 1

" mucompletion
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect
let g:clang_library_path = '/usr/lib/libclang.so'
let g:clang_user_options = '-std=c++14'
let g:clang_complete_auto = 1
let g:mucomplete#enable_auto_at_startup = 1

" ale config
let g:ale_set_highlights = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 0
