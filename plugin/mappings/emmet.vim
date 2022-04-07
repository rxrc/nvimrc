" Only enable Emmet mappings in insert mode.
let g:user_emmet_mode='iv'

" Set the Emmet leader.
let g:user_emmet_leader_key = '<C-O>'

" Customize Emmet mappings.
imap <C-E> <Plug>(emmet-expand-abbr)

au BufNewFile,BufRead *.mjml set filetype=html
