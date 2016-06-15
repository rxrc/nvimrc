let g:deoplete#omni_patterns.tex =
  \ '\v\\%('
  \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
  \ . '|hyperref\s*\[[^]]*'
  \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|%(include%(only)?|input)\s*\{[^}]*'
  \ . ')\m'
