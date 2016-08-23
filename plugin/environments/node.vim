" Set nvm root.
if empty($NVM_ROOT)
  let s:nvm_root = $HOME . '/.nvm'
else
  let s:nvm_root = $NVM_ROOT
endif

" Add local node module binaries to path.
function! s:node_add_local_bins()
  let l:bin_path = finddir('node_modules', '.;') . '/.bin'

  let $PATH = substitute($PATH, ':[^:]*\/node_modules\/.bin', '', '')
  if isdirectory(l:bin_path)
    let l:bin_path = fnamemodify(l:bin_path, ':p')
    let l:bin_path = substitute(l:bin_path, '\/$', '', '')
    let $PATH = l:bin_path . ':' . $PATH
  endif
endfunction

" All nvm managed binaries to path.
let g:env_node_bin = ''
function! s:node_add_bin_handler(job_id, data, event)
  if a:data[0] =~# '^' . s:nvm_root . '/versions/node/.*/bin/node$'
    let l:bin_path = substitute(a:data[0], '/node$', '', '')
    let $PATH = substitute($PATH, ':' . l:bin_path, '', '')
    let $PATH = l:bin_path . ':' . $PATH
    call s:node_add_local_bins()
    let g:env_node_bin = l:bin_path . '/'
  endif
endfunction

function! s:node_add_bins()
  let l:nvm_command = '. ' . s:nvm_root . '/nvm.sh && nvm which'
  let l:callbacks = { 'on_stdout': function('s:node_add_bin_handler') }
  call jobstart(l:nvm_command, l:callbacks)
endfunction

" Update binary paths on entering buffer.
augroup node-local-bin
  autocmd!
  autocmd BufEnter * call s:node_add_local_bins()
  autocmd BufEnter * call s:node_add_bins()
augroup END
