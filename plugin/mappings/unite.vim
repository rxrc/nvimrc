" Add mappings for Unite buffers.
nnoremap <Leader>a :<C-U>Unite grep:.<CR>
nnoremap <Leader>b :<C-U>Unite -no-split -buffer-name=buffer
  \ -start-insert buffer<CR>
nnoremap <Leader>e :<C-U>Unite -no-split -buffer-name=files
  \ -start-insert file_rec/async:!<CR>

" Add mapping for Unite neoyank buffer.
nnoremap <Leader>y :<C-U>Unite -no-split -buffer-name=yank history/yank<CR>

" Apply unite mappings when opening unite buffer.
augroup unite-buffer-mappings
  autocmd!
  " Enable navigation with ctrl-j and ctrl-k in insert mode.
  autocmd FileType unite imap <buffer> <C-J> <Plug>(unite_select_next_line)
  autocmd FileType unite imap <buffer> <C-K> <Plug>(unite_select_previous_line)

  " Escape should exit buffer from normal mode.
  autocmd FileType unite nmap <buffer> <Esc> q
augroup END
