if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/deoppet.nvim')

  call dein#add('Shougo/defx.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('raimondi/delimitmate')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('roman/golden-ratio')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('edkolev/tmuxline.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
set number
set splitbelow
set splitright
set shiftwidth=4
set softtabstop=4
set nowrap

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

" use deoplete
let g:deoplete#enable_at_startup = 1

" golden-ratio config
let g:golden_ratio_exclude_nonmodifiable = 1

" vim-airline config
let g:airline_theme = 'fairyfloss'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
