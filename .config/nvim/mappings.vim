" add Print command
command Print execute "!lp %"

" run program
autocmd FileType go nnoremap <buffer> <F12> :tab terminal go run .<CR>
autocmd FileType python nnoremap <buffer> <F12> :tab terminal bpython -i %<CR>
autocmd FileType sh nnoremap <buffer> <F12> :tab terminal sh %<CR>

" Go: disable vim-go :GoDef short cut (gd)
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" Go: disable vim-go code completion
let g:go_code_completion_enabled = 0

" Go: format code on write with coc-go
let g:go_fmt_autosave = 0
autocmd BufWritePre *.go silent! :call CocAction('runCommand', 'editor.action.organizeImport')
      \ | :call CocAction('format')
      
" LanguageServer: tab autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" LanguageServer: complete on enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" LanguageServer: Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" LanguageServer: rename symbol under cursor
nmap <leader>rn <Plug>(coc-rename)

" LanguageServer: add function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" LanguageServer: goto mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" LanguageServer: CocList mappings
nnoremap <silent> <space>e  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" ArgWrap: wrap arguments
nnoremap <silent> <leader>a :ArgWrap<CR>
