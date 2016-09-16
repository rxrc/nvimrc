" Toggle lexima.
nnoremap <silent><expr> coe
  \ exists('b:lexima_disabled') && b:lexima_disabled ?
  \ ":<C-U>let b:lexima_disabled = 0<CR>:echo 'Enabled lexima on buffer'<CR>" :
  \ ":<C-U>let b:lexima_disabled = 1<CR>:echo 'Disabled lexima on buffer'<CR>"

" Fix newline mappings to work with lexima.
try
  call lexima#insmode#define_altanative_key('<C-CR>', '<CR>')
  call lexima#insmode#define_altanative_key('<S-CR>', '<CR>')
  call lexima#insmode#define_altanative_key('<C-J>', '<CR>')
catch /^Vim\%((\a\+)\)\=:E117/
endtry

" Use ctrl-h as backspace.
imap <expr> <C-H> lexima#expand('<LT>BS>', 'i')

" Navigate popup down with ctrl-j.
imap <expr> <C-J> pumvisible() ? "<C-N>" : lexima#expand('<LT>CR>', 'i')

" Navigate popup up with ctrl-k or split line.
imap <expr> <C-K> pumvisible() ?
  \ "<C-P>" : lexima#expand('<LT>CR>', 'i') . "<Up><C-O>$"
