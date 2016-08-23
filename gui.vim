" Enable true color mode.
set termguicolors

" Disable visual bell.
set visualbell t_vb=

" Set focus to follow mouse.
set mousefocus

" Set right mouse button action.
set mousemodel=extend

" Set font.
GuiFont Inconsolata-g for Powerline:h12

" Set color scheme and vim-airline theme dynamically.
let g:zenburn_high_Contrast = 1
let g:airline_theme = 'zenburn'
set background=dark
colorscheme zenburn
