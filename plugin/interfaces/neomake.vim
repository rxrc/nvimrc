" Run Neomake on write.
augroup neomake-run
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

function! s:local_javascript_makers()
  let l:makers = []

  if executable('jshint') && !executable('eslint')
    call add(l:makers, 'jshint')
  endif

  if executable('eslint') && !executable('standard')
    call add(l:makers, 'eslint')
  endif

  if executable('standard')
    call add(l:makers, 'standard')
  endif

  if executable('flow') && filereadable(findfile('.flowconfig', '.;'))
    call add(l:makers, 'flow')
  endif

  return l:makers
endfunction

" Set enabled node makers.
augroup neomake-makers-node
  autocmd!
  autocmd FileType javascript
    \ let b:neomake_javascript_enabled_makers = s:local_javascript_makers()
  autocmd FileType javascript.jsx
    \ let b:neomake_jsx_enabled_makers = s:local_javascript_makers()
augroup END
