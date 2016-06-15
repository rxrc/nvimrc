" Add mappings for fireplace.vim.
augroup fireplace-local-mappings
  autocmd!
  autocmd FileType clojure nnoremap <Leader>d :<C-U>Doc<Space>
  autocmd FileType clojure nnoremap <Leader>D :<C-U>FindDoc<Space>
augroup END
