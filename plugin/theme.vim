" Set maximum terminal color space.
set t_Co=256

" Set promptline.vim theme.
let g:promptline_theme = 'airline'

" Set background dynamically.
if empty($VIM_BACKGROUND)
  set background=dark
else
  let &background = $VIM_BACKGROUND
endif

" Set color scheme and vim-airline theme dynamically.
if empty($VIM_COLOR)
  let g:airline_theme = 'solarized'
  colorscheme solarized
elseif $VIM_COLOR =~# "^base16-"
  let g:airline_theme = substitute($VIM_COLOR, '-', '_', '')
endif

" Add hook for plugins which need to load after GUI.
function! InitTheme()
endfunction
call InitTheme()
