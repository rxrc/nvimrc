function! s:local_css_makers()
  let l:linters = []

  if executable('csslint') && !executable('stylelint')
    call add(l:linters, 'csslint')
  endif

  if executable('stylelint') && executable('prettier')
    call add(l:linters, 'prettier')
    call add(l:linters, 'stylelint')
    return l:linters
  endif

  if executable('stylelint')
    call add(l:linters, 'stylelint')
  endif

  if executable('prettier')
    call add(l:linters, 'prettier')
  endif

  return l:linters
endfunction

function! s:local_javascript_makers()
  let l:linters = []

  if executable('flow') && filereadable(findfile('.flowconfig', '.;'))
    call add(l:linters, 'flow')
  endif

  if executable('standard') && executable('prettier')
    call add(l:linters, 'prettier')
    call add(l:linters, 'standard')
    return l:linters
  endif

  if executable('standard') && !executable('tsc')
    call add(l:linters, 'standard')
    return l:linters
  endif

  if executable('prettier')
    call add(l:linters, 'prettier')
    return l:linters
  endif

  if executable('eslint')
    call add(l:linters, 'eslint')
    return l:linters
  endif

  if executable('jshint')
    call add(l:linters, 'jshint')
    return l:linters
  endif

  return l:linters
endfunction

" Set enabled node linters.
augroup ale-linters-node
  autocmd!
  autocmd FileType css
    \ let b:ale_linters = s:local_css_makers()
  autocmd FileType javascript
    \ let b:ale_linters = s:local_javascript_makers()
  autocmd FileType javascript.jsx
    \ let b:ale_linters = s:local_javascript_makers()
  autocmd FileType javascript
    \ let b:ale_fixers = s:local_javascript_makers()
  autocmd FileType javascript.jsx
    \ let b:ale_fixers = s:local_javascript_makers()
  autocmd FileType typescript
    \ let b:ale_linters = s:local_javascript_makers()
  autocmd FileType typescriptreact
    \ let b:ale_linters = s:local_javascript_makers()
  autocmd FileType typescript
    \ let b:ale_fixers = s:local_javascript_makers()
  autocmd FileType typescriptreact
    \ let b:ale_fixers = s:local_javascript_makers()
augroup END
