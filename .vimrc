syntax on

set autoindent
set smartindent
set nu

set hlsearch
set incsearch
set ic

set scrolloff=999

"set tab to space
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set backspace=indent,eol,start

"wrap lines
set textwidth=0
set wrap

"line
set cursorline

set encoding=utf-8

"make /g flag default
set gdefault

"create print command
command Print execute "!lp %"

"include vundle if here
if filereadable($HOME."/.vim/vundle")
    source ~/.vim/vundle
endif
