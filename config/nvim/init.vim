syntax on

set guicursor=
set number

call plug#begin('~/.vim/plugged')

" Wanna learn
Plug 'mbbill/undotree'
" Language packs
Plug 'sheerun/vim-polyglot'
" Gruvbox
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'phanviet/vim-monokai-pro'
" Bottom stats
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
" for evenings:
" colorscheme gruvbox-material

if executable('rg')
    let g:rg_derive_root='true'
endif

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
