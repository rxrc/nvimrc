" Detect Hugo HTML Templates
" https://tech.serhatteker.com/post/2022-06/nvim-syntax-highlight-hugo-html/
function! s:detect_go_tmpl()
  let l:ext = expand('%:e')
  if  (ext == "html") && search("{{") != 0
    setfiletype gohtmltmpl
  endif
  if  (l:ext == "md") && search("{{") != 0
    setfiletype gotexttmpl
  endif
endfunction

augroup detect-go-tmpl
  autocmd BufEnter *.html call s:detect_go_tmpl()
  autocmd BufEnter *.md call s:detect_go_tmpl()
augroup END
