" Use spelling language defined in VIM_LANG.
let b:spelllang = 'en_us'
if !empty($VIM_LANG)
  let b:spelllang = $VIM_LANG
endif

" Enable spell checking.
set spell
let &spelllang = b:spelllang

" Use local spellfile if available.
function! s:spell_auto_local_spellfile() abort
  let b:spellfile = expand('%:p:h') . '/.spellfile.utf-8.add'
  if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    setlocal spell
    set spell
    let &spelllang = b:spelllang
  else
    setlocal spellfile=
  endif
endfunction

" Load local spellfile when opening file.
augroup spellfile-local-spellfile
  autocmd!
  autocmd FileType * call s:spell_auto_local_spellfile()
augroup END
