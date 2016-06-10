" Delete trailing whitespace.
augroup better-whitespace-strip
  autocmd!
  autocmd BufWritePre * StripWhitespace
augroup END
