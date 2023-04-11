" Add mappings for Unite buffers.
function! UniteMappings(quiet)
  nnoremap <Leader>a :<C-U>Unite grep:.<CR>
  nnoremap <Leader>b :<C-U>Unite -no-split -buffer-name=buffer
    \ -start-insert buffer<CR>
  nnoremap <Leader>e :<C-U>Unite -no-split -buffer-name=files
    \ -start-insert file_rec/async:!<CR>

  " Save that Unite mappings were created.
  let g:mapped_unite = 1

  if !a:quiet
    echo 'Now using Unite'
  endif
endfunction

" Overrides mappings only when fzf is installed.
if executable('fzf')
  " Add shortcuts to fzf mappings.
  function! FzfMappings(quiet)
    nmap <Leader>a <Leader>fa
    nmap <Leader>b <Leader>fj
    nmap <Leader>e <Leader>fg

    " Save that Unite mappings were removed.
    let g:mapped_unite = 0

    if !a:quiet
      echo 'Now using fzf'
    endif
  endfunction

  " Toggle between Unite and fzf mappings.
  nnoremap <silent><expr> yoU
    \ g:mapped_unite ?
    \ ":<C-U>call FzfMappings(0)<CR>" :
    \ ":<C-U>call UniteMappings(0)<CR>"

  call FzfMappings(1)
else
  call UniteMappings(1)
end

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
