" Create and set cache directories.
let s:cache_root = stdpath('cache')

if !isdirectory(s:cache_root)
  call mkdir(s:cache_root, 'p')
endif

for dir in ['backup', 'swap', 'undo', 'session']
  if !isdirectory(s:cache_root . '/' . dir)
    call mkdir(s:cache_root . '/' . dir, 'p')
  endif
endfor

let &backupdir = s:cache_root . '/backup'
let &directory = s:cache_root . '/swap'
let &undodir = s:cache_root . '/undo'

" Set vim-session path (created above).
let g:session_directory = s:cache_root . '/session'
