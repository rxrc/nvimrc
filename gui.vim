" Enable true color mode.
set termguicolors

" Disable visual bell.
set visualbell t_vb=

" Set focus to follow mouse.
set mousefocus

" Set right mouse button action.
set mousemodel=extend

if exists(':GuiFont')
  GuiFont! FiraCode Nerd Font:h13
endif

if exists(':GuiRenderLigatures')
  GuiRenderLigatures 1
endif

if exists(':GuiTabline')
  GuiTabline 0
endif

if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

if exists(':GuiScrollBar')
  GuiScrollBar 0
endif

" Set color scheme and vim-airline theme dynamically.
let g:zenburn_high_Contrast = 1
let g:airline_theme = 'one'
set background=dark

" Set nvim-gtk settings.
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'FiraCode Nerd Font 13')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
endif
