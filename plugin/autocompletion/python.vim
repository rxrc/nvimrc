" Show docstring with jedi.
let g:deoplete#sources#jedi#show_docstring = 1

" Set deoplete-jedi path from vim-pyenv.
augroup pyenv-deoplete-jedi-path
  autocmd!
  autocmd User vim-pyenv-activate-post
    \ let g:deoplete#sources#jedi#python_path = g:pyenv#python_exec
  autocmd User vim-pyenv-deactivate-post
    \ unlet g:deoplete#sources#jedi#python_path
augroup END
