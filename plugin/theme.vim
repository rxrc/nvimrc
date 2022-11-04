if exists("g:neovide") || !empty($KITTY_PID)
  " Enable true color mode.
  set termguicolors

  " Disable visual bell.
  set visualbell t_vb=

  " Set focus to follow mouse.
  set mousefocus

  " Set right mouse button action.
  set mousemodel=extend
endif

if exists("g:neovide")
  " Set GUI font.
  set guifont=Fira\ Code\ Nerd\ Font:h14

  " Set color scheme.
  let g:airline_theme = 'one'
  set background=dark
  colorscheme one

  " Toggle color scheme.
  function! s:dark_theme()
    set background=dark
  endfunction
  function! s:light_theme()
    set background=light
  endfunction
  augroup lumen-neovide
    autocmd User LumenLight call s:light_theme()
    autocmd User LumenDark call s:dark_theme()
  augroup END
else
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
    colorscheme $VIM_COLOR
    let g:airline_theme = substitute($VIM_COLOR, '-', '_', 'g')
  else
    colorscheme $VIM_COLOR
    let g:airline_theme = tolower($VIM_COLOR)
  endif
endif
