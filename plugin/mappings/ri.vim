" Add mappings for ri.vim.
augroup ri-local-mappings
  autocmd!
  autocmd FileType ruby
    \ nnoremap <Leader>d :<C-U>call ri#OpenSearchPrompt(0)<CR>
  autocmd FileType ruby
    \ nnoremap <Leader>D :<C-U>call ri#OpenSearchPrompt(1)<CR>
augroup END
