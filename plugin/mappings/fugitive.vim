" Add mappings for fugitive commands.
nnoremap <Leader>gg :<C-U>Git<Space>
nnoremap <Leader>gk :<C-U>Gsplit<Space>
nnoremap <Leader>gj :<C-U>Gvsplit<Space>
nnoremap <Leader>ge :<C-U>Gedit<Space>
nnoremap <Leader>gm :<C-U>GMove<Space>
nnoremap <silent> <Leader>gd :<C-U>Gdiffsplit!<CR>
nnoremap <silent> <Leader>gs :<C-U>Git status<CR>
nnoremap <silent> <Leader>ga :<C-U>Gwrite<CR>
nnoremap <silent> <Leader>gl :<C-U>G log<CR>
nnoremap <silent> <Leader>gc :<C-U>Git commit<CR>
nnoremap <silent> <Leader>gb :<C-U>G blame<CR>
nnoremap <silent> <Leader>gw :<C-U>GRemove<CR>
