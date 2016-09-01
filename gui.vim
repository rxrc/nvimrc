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

" Disable promptline and tmuxline extensions.
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0

" Un-set promptline and tmuxline snapshot.
unlet g:airline#extensions#promptline#snapshot_file
unlet g:airline#extensions#tmuxline#snapshot_file
