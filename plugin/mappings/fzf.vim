" Add mappings for fzf commands.
nnoremap <silent> <Leader>ff :<C-U>FzfFiles<CR>
nnoremap <silent> <Leader>fg :<C-U>FzfGitFiles<CR>
nnoremap <silent> <Leader>fs :<C-U>FzfHistory<CR>
nnoremap <silent> <Leader>fa :<C-U>FzfAg<CR>
nnoremap <silent> <Leader>fd :<C-U>FzfHelptags<CR>
nnoremap <silent> <Leader>fq :<C-U>FzfMarks<CR>
nnoremap <silent> <Leader>fl :<C-U>FzfLines<CR>
nnoremap <silent> <Leader>fk :<C-U>FzfBLines<CR>
nnoremap <silent> <Leader>fj :<C-U>FzfBuffers<CR>
nnoremap <silent> <Leader>fe :<C-U>FzfCommits<CR>
nnoremap <silent> <Leader>fh :<C-U>FzfBCommits<CR>
nnoremap <silent> <Leader>ft :<C-U>FzfTags<CR>
nnoremap <silent> <Leader>fc :<C-U>FzfBTags<CR>
nnoremap <silent> <Leader>f<Space> :<C-U>FzfHistory:<CR>
nnoremap <silent> <Leader>f/ :<C-U>FzfHistory/<CR>
nnoremap <silent> <Leader>fv :<C-U>FzfCommands<CR>
nnoremap <silent> <Leader>fm :<C-U>FzfMaps<CR>

" Reset any conflicting terminal mappings.
augroup fzf-terminal-mappings
  autocmd!
  autocmd FileType fzf tunmap <buffer> <C-H>
  autocmd FileType fzf tunmap <buffer> <C-J>
  autocmd FileType fzf tunmap <buffer> <C-K>
  autocmd FileType fzf tunmap <buffer> <C-L>
augroup END

" Set overrides only when fzf is installed.
if executable('fzf')
  " Use fzf for line completion.
  imap <C-X><C-L> <Plug>(fzf-complete-line)

  " Use fzf for path completion.
  imap <C-X><C-F> <Plug>(fzf-complete-path)

  " Use fzf for dictionary completion.
  if filereadable('/usr/share/dict/words')
    imap <C-X><C-K> <Plug>(fzf-complete-word)
  endif
endif
