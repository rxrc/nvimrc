" Set Tern command.
let g:tern#arguments = ['--persistent']

augroup tern-command
  autocmd!
  autocmd BufEnter * let g:tern#command = [g:env_node_bin . 'tern']
augroup END
