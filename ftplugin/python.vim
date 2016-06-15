" Synchronize jedi-vim with pyenv.
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup pyenv-jedi-version
    autocmd!
    autocmd User vim-pyenv-activate-post echo 'hey'
    autocmd User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif
