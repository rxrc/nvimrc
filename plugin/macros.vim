function! ChangelogVersion(new_ver)
  let ver_date=system("date +%Y-%m-%d")
  normal! gg/## 0f Da [
  put =a:new_ver
  normal! Ji] /
  put =ver_date
  normal! kJkJkJxo
  let @m = 'gg/## 0f["vyi]/Unreleased$Fvl"v:tHa...jyyP0"v:i]$Fvl"oy$D"vpFv;ldfv"oPa...v'
  normal! @m
endfunction
