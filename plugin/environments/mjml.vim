" Treat mjml and html
augroup mjml
  autocmd!
  autocmd BufNewFile,BufRead *.mjml set filetype=html
augroup END
