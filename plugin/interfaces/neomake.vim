" Run Neomake on write.
augroup neomake-run
  autocmd!
  autocmd BufWritePost * Neomake
augroup END
