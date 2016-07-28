" Set UltiSnips triggers.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-L>'
let g:UltiSnipsJumpBackwardTrigger = '<C-H>'

" Start manual completion with ctrl-space.
inoremap <expr> <C-Space> deoplete#manual_complete()

" Close popup on enter.
inoremap <expr> <CR> deoplete#close_popup() . "<CR>"

" Smart close popup on ctrl-w.
inoremap <expr> <C-W> pumvisible() ? deoplete#smart_close_popup() : "<C-W>"

" Use ctrl-h to navigate insert mode or as backspace in popup.
inoremap <expr> <C-H> pumvisible() ? "<BS>" : "<C-H>"

" Also navigate popup with ctrl-j and ctrl-k.
inoremap <expr> <C-J> pumvisible() ? "<C-N>" : "<C-J>"
inoremap <expr> <C-K> pumvisible() ? "<C-P>" : "<C-J><Up><C-O>$"

" Provide jump function that returns result.
let g:ulti_jump_forwards_res = 0
function! UltiSnipsJumpForwards()
  call UltiSnips#JumpForwards()
  return g:ulti_jump_forwards_res
endfunction

" Provide helper function to define ctrl-l mapping.
function! DeopleteClosePopup()
  if pumvisible()
    return deoplete#close_popup()
  else
    let b:cursor_position = getcurpos()
    call cursor(0, b:cursor_position[2] + 1)
    return ''
  endif
endfunction

" Use ctrl-l to navigate insert mode, close popup, or expand snippets.
inoremap <silent> <C-L>
  \ <C-R>=(UltiSnipsJumpForwards() > 0) ? '' : DeopleteClosePopup()<CR>
