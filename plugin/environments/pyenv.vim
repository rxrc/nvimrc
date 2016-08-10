" Set pyenv root.
if empty($PYENV_ROOT)
  let s:pyenv_root = $HOME . '/.pyenv'
else
  let s:pyenv_root = $PYENV_ROOT
endif

if isdirectory(s:pyenv_root)
  " Add pyenv bin to path.
  let s:pyenv_bin = s:pyenv_root . '/bin'
  let $PATH = substitute($PATH, s:pyenv_bin . ':', '', '')
  let $PATH = s:pyenv_bin . ':' . $PATH

  " Add pyenv shims to path.
  let s:pyenv_shims = s:pyenv_root . '/shims'
  let $PATH = substitute($PATH, s:pyenv_shims . ':', '', '')
  let $PATH = s:pyenv_shims . ':' . $PATH
endif
