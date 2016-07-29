" Start manual completion with ctrl-space.
inoremap <expr> <C-Space> deoplete#manual_complete()

" Close popup on enter and exit insert mode.
inoremap <expr> <CR> deoplete#close_popup() . "<CR>"

" Smart close popup on ctrl-w.
inoremap <expr> <C-W> pumvisible() ? deoplete#smart_close_popup() : "<C-W>"

" Navigate popup with ctrl-j and ctrl-k and define non-popup actions.
inoremap <expr> <C-J> pumvisible() ? "<C-N>" : "<C-J>"
inoremap <expr> <C-K> pumvisible() ? "<C-P>" : "<C-J><Up><C-O>$"

" Close popup on ctrl-l and define non-popup action.
inoremap <expr> <C-L> pumvisible() ? deoplete#close_popup() : "<Right>"
