function! s:local_css_makers()
  let l:linters = []

  if executable('csslint') && !executable('stylelint')
    call add(l:linters, 'csslint')
  endif

  if executable('stylelint')
    call add(l:linters, 'stylelint')
  endif

  return l:linters
endfunction

function! s:local_javascript_makers()
  let l:linters = []

  if executable('jshint') && !executable('eslint')
    call add(l:linters, 'jshint')
  endif

  if executable('eslint') && !executable('standard')
    call add(l:linters, 'eslint')
  endif

  if executable('standard')
    call add(l:linters, 'standard')
  endif

  if executable('flow') && filereadable(findfile('.flowconfig', '.;'))
    call add(l:linters, 'flow')
  endif

  return l:linters
endfunction

" Set enabled node linters.
augroup ale-linters-node
  autocmd!
  autocmd FileType css
    \ let b:ale_linters = {'css': s:local_css_makers()}
  autocmd FileType javascript
    \ let b:ale_linters = {'javascript': s:local_javascript_makers()}
  autocmd FileType javascript.jsx
    \ let b:ale_linters = {'javascript': s:local_javascript_makers()}
augroup END
