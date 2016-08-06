" Start manual completion with ctrl-space.
inoremap <expr> <C-Space> deoplete#manual_complete()

" Smart close popup on ctrl-w.
inoremap <expr> <C-W> pumvisible() ? deoplete#smart_close_popup() : "<C-W>"

" Navigate popup down with ctrl-j.
" NOTE: This is redefined in lexima.vim.
" inoremap <expr> <C-J> pumvisible() ? "<C-N>" : "<C-J>"

" Navigate popup up with ctrl-k or split line.
" NOTE: This is redefined in lexima.vim.
" inoremap <expr> <C-K> pumvisible() ? "<C-P>" : "<C-J><Up><C-O>$"

" Close popup on ctrl-l and define non-popup action.
inoremap <expr> <C-L> pumvisible() ? deoplete#close_popup() : "<Right>"
