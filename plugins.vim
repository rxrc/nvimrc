"
" Global Configuration
"

" Map space to leader.
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Libraries
Plug 'tpope/vim-repeat'

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
Plug 'luochen1990/rainbow'

" Text Objects
Plug 'kana/vim-textobj-user'
     \ | Plug 'kana/vim-textobj-entire'

" Sneak
Plug 'justinmk/vim-sneak'

" Marks
Plug 'kshenoy/vim-signature'

" Macros
Plug 'bronson/vim-visual-star-search'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Clipboard
Plug 'svermeulen/vim-easyclip'

" Buffer
Plug 'moll/vim-bbye'

"
" Internal Interfaces
"

" Undo
Plug 'mbbill/undotree'

" Session
Plug 'xolox/vim-misc'
     \ | Plug 'xolox/vim-session'

" Unicode
Plug 'chrisbra/unicode.vim'

" Autocompletion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'shougo/deoplete.nvim',
     \ { 'do': function('DoRemote') }
Plug 'shougo/neosnippet'
Plug 'rxrc/neosnippet-snippets',
     \ { 'branch': 'rxrc' }
Plug 'rxrc/vim-snippets',
     \ { 'branch': 'rxrc' }

"
" External Interfaces
"

" Neomake
Plug 'neomake/neomake'

" Projectionist
Plug 'tpope/vim-projectionist'

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

"
" rainbow

" Enable rainbow parentheses.
let g:rainbow_active = 1

"
" vim-signature

" Set signature leader.
let g:SignatureMap = { 'Leader': "\<Leader\>;" }

"
" vim-commentary

" Disable \\ commentary maps.
let g:commentary_map_backslash = 0

"
" deoplete

" Enable deoplete.
let g:deoplete#enable_at_startup = 1

"
" neosnippet

" Set snippet paths.
let neosnippet#snippets_directory = join([
  \ '../neocomplcache-snippets/neosnippets',
  \ '../vim-snippets/snippets'
  \ ], ',')
