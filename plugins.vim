"
" Global Configuration
"

" Map space to leader.
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Sensible Defaults
Plug 'tpope/vim-sensible'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Prompt and Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'

" Themes and Colors
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'jnurmine/zenburn'

"
" Editor
"

" Syntax
Plug 'chrisbra/colorizer'

" Text Objects
Plug 'kana/vim-textobj-user'
     \ | Plug 'kana/vim-textobj-entire'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

"
" External Interfaces
"

" Neomake
Plug 'neomake/neomake'

"
" Initialization Settings
"

"
" vim-airline

" Disable Powerline.
let g:powerline_loaded = 1

" Use Powerline fonts for vim-airline.
let g:airline_powerline_fonts = 1

" Enable tabline.
let g:airline#extensions#tabline#enabled = 1

" Only true in GUI.
if $NVIM_TUI_ENABLE_TRUE_COLOR
  " Disable promptline and tmuxline extensions.
  let g:airline#extensions#tmuxline#enabled = 0
  let g:airline#extensions#promptline#enabled = 0
else
  " Set promptline and tmuxline snapshot.
  let g:airline#extensions#promptline#snapshot_file = $HOME . '/.promptline.sh'
  let g:airline#extensions#tmuxline#snapshot_file = $HOME . '/.tmuxline.conf'
endif

"
" colorizer

" Enable colors for specific file types.
let g:colorizer_auto_filetype = join([
  \ 'css',
  \ 'html',
  \ 'html.handlebars',
  \ 'sass',
  \ 'scss'
  \ ], ',')
