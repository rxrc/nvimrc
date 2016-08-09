" Enable tern mappings.
let g:tern_map_keys = 1

" Add extra tern mappings.
augroup tern-local-mappings
  autocmd!
  autocmd FileType javascript nnoremap <Leader>d :<C-U>TernDoc<CR>
  autocmd FileType javascript nnoremap <Leader>D :<C-U>TernDocBrowse<CR>
augroup END
