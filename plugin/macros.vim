function! ChangelogUrls(new_ver)
  let ver_date=system("date +%Y-%m-%d")
  normal! gg/## 
  put =a:new_ver
  normal! Ji] /
  put =ver_date
  normal! kJkJkJxo
  let @m = 'gg/## 
  normal! @m
endfunction