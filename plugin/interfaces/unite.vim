" Set matcher behavior.
if exists('*unite#filters#matcher_default#use')
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
endif

" Use ag or ack if available.
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt=''
endif

" Use ag to filter the async Unite buffer.
if executable('ag')
  let g:unite_source_rec_async_command = [
    \ 'ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''
    \ ]
endif
