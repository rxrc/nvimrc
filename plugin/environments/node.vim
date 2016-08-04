" All local node module binaries to path.
function! s:node_add_local_bins()
  let l:bin_path = finddir('node_modules', '.;') . '/.bin'

  let $PATH = substitute($PATH, ':[^:]*\/node_modules\/.bin', '', '')

  if isdirectory(l:bin_path)
    let l:bin_path = fnamemodify(l:bin_path, ':p')
    let l:bin_path = substitute(l:bin_path, '\/$', '', '')
    let $PATH .= ':' . l:bin_path
  endif
endfunction

" Update local node binary path on entering buffer.
augroup node-local-bin
  autocmd!
  autocmd BufEnter * call s:node_add_local_bins()
augroup END
