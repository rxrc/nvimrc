" Create and set cache directories.
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME . '/.cache'
endif

if !isdirectory($XDG_CACHE_HOME . '/nvim')
  call mkdir($XDG_CACHE_HOME . '/nvim', 'p')
endif

for dir in ['backup', 'swap', 'undo', 'session']
  if !isdirectory($XDG_CACHE_HOME . '/nvim/' . dir)
    call mkdir($XDG_CACHE_HOME . '/nvim/' . dir, 'p')
  endif
endfor

set backupdir=$XDG_CACHE_HOME/nvim/backup
set directory=$XDG_CACHE_HOME/nvim/swap
set undodir=$XDG_CACHE_HOME/nvim/undo

" Set vim-session path (created above).
let g:session_directory = $XDG_CACHE_HOME . '/nvim/session'

" Load ginit for neovim-dot-app.
if exists('neovim_dot_app')
  source $XDG_CONFIG_HOME/nvim/ginit.vim
endif
