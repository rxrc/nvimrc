" Enable spell checking.
set spell spelllang=en_us

" Use local spellfile if available.
function! s:spell_auto_local_spellfile() abort
  let b:spellfile = expand('%:p:h') . '/.spellfile.utf-8.add'
  if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    setlocal spell
    setlocal spelllang=en_us
  else
    setlocal spellfile=
  endif
endfunction

" Load local spellfile when opening file.
augroup spellfile-local-spellfile
  autocmd!
  autocmd FileType * call s:spell_auto_local_spellfile()
augroup END
