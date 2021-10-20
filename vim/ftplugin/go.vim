set backspace=indent,eol,start

"no sé
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


"special mapping 
inoremap <buffer> . .<C-x><C-o>

"custom maps
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage-toggle)
nmap <leader>e <Plug>(go-rename)
nmap <leader>s <Plug>(go-implements)
nmap <leader>i <Plug>(go-info)

"map for definitions
nmap <leader>ds <Plug>(go-def-split)
nmap <leader>dv <Plug>(go-def-vertical)

"map for alternatives
nmap <leader>ae <Plug>(go-alternate-edit)
nmap <leader>av <Plug>(go-alternate-vertical)

"popup windows for documentation
let g:go_doc_popup_window = 1
