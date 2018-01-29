" Enable true color mode.
set termguicolors

" Disable visual bell.
set visualbell t_vb=

" Set focus to follow mouse.
set mousefocus

" Set right mouse button action.
set mousemodel=extend

" Set font.
if exists('GuiFont')
  GuiFont Inconsolata-g for Powerline:h12
endif

" Set color scheme and vim-airline theme dynamically.
let g:zenburn_high_Contrast = 1
let g:airline_theme = 'one'
set background=dark
colorscheme one

" Set nvim-gtk settings.
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Fira Code 13')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif
