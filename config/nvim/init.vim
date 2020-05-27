" vim-plug
call plug#begin()
" A code-completion for vim
" Plug 'ycm-core/youcompleteme'
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
" deus colorscheme
Plug 'ajmwagar/vim-deus'
" vim plugin that displays tags in a window
Plug 'majutsushi/tagbar'
" A tree explorer for vim
Plug 'scrooloose/nerdtree'
" themes
Plug 'daylerees/colour-schemes', { 'rtp': 'vim/'}
call plug#end()

set exrc
set secure
filetype plugin indent on
syntax enable
set number
set splitbelow
set splitright
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap
set smarttab
set noexpandtab

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set t_Co=256
set termguicolors

set background=dark    " Setting dark mode
colorscheme peacock
let g:deus_termcolors=256

hi Normal guibg=NONE ctermbg=NONE

" Vim keys remapping
" Tab bindings
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tH :tabfirst<CR>
nnoremap tL :tablast<CR>

" Window split
nnoremap nv :vnew<Space>
nnoremap nh :new<Space>

" Window management
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l

" vim-airline config
let g:airline_theme = 'term'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1


" golden ratio config
" let g:golden_ratio_exclude_nonmodifiable = 1

" change tagbar toggle to 'tt'
nnoremap tt :TagbarToggle<CR>

" change nerdtree toggle to 'nt'
nnoremap nt :NERDTreeToggle<CR>
let g:NERDTreeAutoCenter = 1
