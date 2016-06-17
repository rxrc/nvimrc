" Use spelling language defined in VIM_LANG.
let g:spelllang = 'en_us'
if !empty($VIM_LANG)
  let g:spelllang = $VIM_LANG
endif

" Enable spell checking.
set spell
let &spelllang = g:spelllang

" Use local spellfile if available.
function! s:spell_auto_local_spellfile() abort
  let b:spellfile = expand('%:p:h') . '/.spellfile.utf-8.add'
  if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    setlocal spell
    set spell
    let &spelllang = g:spelllang
  else
    setlocal spellfile=
  endif
endfunction

" Load local spellfile when opening file.
augroup spellfile-local-spellfile
  autocmd!
  autocmd FileType * call s:spell_auto_local_spellfile()
augroup END

" Create and update the local spellfile.
function! s:mklocalspell() abort
  let b:spellfile = expand('%:p:h') . '/.spellfile.utf-8.add'
  if !filereadable(b:spellfile)
    call system('touch ' . b:spellfile)
  endif
  execute('mkspell! ' . b:spellfile)
  call s:spell_auto_local_spellfile()
endfunction
command! Mklocalspell call s:mklocalspell()

" Disable spelling in terminal.
augroup spell-terminal
  autocmd TermOpen * setlocal nospell
augroup END
