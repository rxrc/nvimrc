" Show docstring with jedi.
call deoplete#custom#source('jedi', 'show_docstring', 1)

" Set deoplete-jedi path from vim-pyenv.
augroup pyenv-deoplete-jedi-path
  autocmd!
  autocmd User vim-pyenv-activate-post
    \ call deoplete#custom#source('jedi', 'python_path', g:pyenv#python_exec)
  autocmd User vim-pyenv-deactivate-post
    \ call deoplete#custom#source('jedi', 'python_path', '')
augroup END
