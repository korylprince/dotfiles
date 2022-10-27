" Default: enable line numbers
set number

" Default: ignore case by default when searching
set ignorecase

" Default: keep current line in middle of screen
set scrolloff=999

" Default: enable automatic indenting
set autoindent
set smartindent

" Default: use spaces for indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Default: automatically insert on terminal
autocmd TermOpen term://* startinsert

" Default: always show sign column
set signcolumn=yes

" Default: disable mouse
set mouse=

" Plugins
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Theme: solarized theme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
highlight link CocFloating markdown

" Go: syntax higlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1

" Airline: enable airline special symbols
let g:airline_powerline_fonts = 1

" LanguageServer: Some language servers have issues with backup files
set nobackup
set nowritebackup

" LanguageServer: Give more space for displaying messages.
set cmdheight=2

" LanguageServer: Having longer updatetime leads to noticeable delays and poor user experience.
set updatetime=300

" LanguageServer: Highlight the current symbol and its references
autocmd CursorHold * silent call CocActionAsync('highlight')

" include mappings
source ~/.config/nvim/mappings.vim
