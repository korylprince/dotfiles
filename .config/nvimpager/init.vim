" Default: ignore case by default when searching
set ignorecase

" Default: enable automatic indenting
set autoindent
set smartindent

" Default: use spaces for indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Default: disable mouse
set mouse=

" Plugins
call plug#begin()
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Theme: solarized theme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
highlight link CocFloating markdown
