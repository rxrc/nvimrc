" Fix on save.
let g:ale_fix_on_save = 1

let g:ale_virtualtext_cursor = 0
let g:ale_cursor_detail = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_echo_cursor = 0
let g:ale_hover_cursor = 0
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
  \ 'go': ['gofmt']
  \ }

function! s:local_python_fixers()
  let l:fixers = []

  if executable('black')
    call add(l:fixers, 'black')
  endif

  return l:fixers
endfunction

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

  if executable('prettier')
    call add(l:linters, 'prettier')
  endif

  if executable('flow') && filereadable(findfile('.flowconfig', '.;'))
    call add(l:linters, 'flow')
  endif

  if executable('xo')
    call add(l:linters, 'xo')
    return l:linters
  endif

  if executable('eslint') && (filereadable(findfile('.eslintrc.json', '.;')) || filereadable(findfile('.eslintrc.cjs', '.;')))
    call add(l:linters, 'eslint')
    return l:linters
  endif

  if executable('standard')
    call add(l:linters, 'standard')
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
  autocmd FileType python
    \ let b:ale_fixers = s:local_python_fixers()
  autocmd FileType ruby
    \ let b:ale_linters = ['standardrb']
  autocmd FileType ruby
    \ let b:ale_fixers = ['standardrb']
augroup END
