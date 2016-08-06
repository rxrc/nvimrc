" Disable for select filetypes.
autocmd FileType clojure let b:lexima_disabled = 1

" Add rules for LaTeX $ pairs.
call lexima#add_rule(
  \ {'char': '$', 'input_after': '$', 'filetype': 'latex'})
call lexima#add_rule(
  \ {'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'latex'})
call lexima#add_rule(
  \ {'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})
