" Start manual completion with ctrl-space.
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
imap <NUL> <C-Space>

" Enable tab completion.
imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"

" Close popup on enter.
inoremap <expr> <CR> deoplete#mappings#close_popup() . "<CR>"

" Smart close popup on ctrl-w.
imap <expr> <C-W> pumvisible() ?
  \ deoplete#mappings#smart_close_popup() : "<C-W>"

" Navigate popup with ctrl-j and ctrl-k.
inoremap <expr> <C-J> pumvisible() ? "<C-N>" : "<C-J>"
inoremap <expr> <C-K> pumvisible() ? "<C-P>" : "<C-K>"

" Enable snippet completion and navigation with ctrl-l.
imap <expr> <C-L> neosnippet#expandable_or_jumpable() ?
  \ "<Plug>(neosnippet_expand_or_jump)" : "<Right>"
