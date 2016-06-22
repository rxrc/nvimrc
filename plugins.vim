"
" Global Configuration
"

" Map space to leader.
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Set Python host.
if empty($VIM_PYTHON)
  let g:python_host_prog = '/bin/python2'
else
  let g:python_host_prog = $VIM_PYTHON
endif

" Set Python 3 host.
if empty($VIM_PYTHON3)
  let g:python3_host_prog = '/bin/python3'
else
  let g:python_host_prog = $VIM_PYTHON3
endif

" Libraries
Plug 'konfekt/fastfold'
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
Plug 'alvan/vim-closetag'
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

" Ctags
Plug 'majutsushi/tagbar'

" Session
Plug 'xolox/vim-misc'
     \ | Plug 'xolox/vim-session'

" Unicode
let unicode_src = 'http://unicode.org/Public/UNIDATA/UnicodeData.txt'
let unicode_dest = './autoload/unicode/UnicodeData.txt'
Plug 'chrisbra/unicode.vim',
     \ { 'do': join(['curl --create-dirs -o', unicode_dest, unicode_src], ' ')}

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

" Unite.vim
Plug 'shougo/vimproc.vim',
     \ { 'do': 'make \|\| gmake' }
     \ | Plug 'shougo/unite.vim'
     \ | Plug 'shougo/neoyank.vim'
     \ | Plug 'shougo/vimfiler.vim'

"
" External Interfaces
"

" Neomake
Plug 'neomake/neomake'

" Terminal
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Autoformat
Plug 'chiel92/vim-autoformat'

" Network
Plug 'eiginn/netrw'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Documentation
Plug 'keith/investigate.vim'

" Thesaurus
Plug 'ron89/thesaurus_query.vim'

" Projectionist
Plug 'tpope/vim-projectionist'

" Portkey
Plug 'dsawardekar/portkey'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" Grepper
Plug 'mhinz/vim-grepper'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"
" Initialization Settings
"

"
" Language Interfaces
"

" Vim-polyglot
Plug 'sheerun/vim-polyglot'

" Emmet
Plug 'mattn/emmet-vim',
     \ { 'for': ['css', 'html', 'html.handlebars',
     \           'javascript.jsx', 'liquid', 'sass', 'scss'] }

" Clojure
Plug 'tpope/vim-fireplace',
     \ { 'for': 'clojure' }

Plug 'tpope/vim-salve',
     \ { 'for': 'clojure' }

Plug 'guns/vim-sexp',
     \ { 'for': 'clojure' }

Plug 'tpope/vim-sexp-mappings-for-regular-people',
     \ { 'for': 'clojure' }

Plug 'guns/vim-clojure-highlight',
     \ { 'for': 'clojure' }

Plug 'venantius/vim-cljfmt',
     \ { 'for': 'clojure' }

Plug 'venantius/vim-eastwood',
     \ { 'for': 'clojure' }

" Haskell
Plug 'bitc/vim-hdevtools',
     \ { 'for': 'haskell' }

" LaTeX
Plug 'lervag/vimtex',
     \ { 'for': 'tex' }

" Python
Plug 'tmhedberg/simpylfold',
     \ { 'for': 'python' }

Plug 'zchee/deoplete-jedi',
     \ { 'for': 'python' }
     \ | Plug 'lambdalisue/vim-pyenv',
              \ { 'for': 'python' }
" Ruby
Plug 'tpope/vim-rbenv',
     \ { 'for': 'ruby' }

Plug 'tpope/vim-bundler',
     \ { 'for': 'ruby' }

Plug 'danchoi/ri.vim',
     \ { 'for': 'ruby' }

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
" closetag.vim

" Enable for specific file types.
let g:closetag_filenames = join([
  \ '*.html',
  \ '*.xhtml',
  \ '*.phtml',
  \ '*.hbs',
  \ '*.js',
  \ '*.jsx'
  \ ], ',')

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

" Initialize omni_patterns.
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif

"
" neosnippet

" Set snippet paths.
let neosnippet#snippets_directory = join([
  \ '../neocomplcache-snippets/neosnippets',
  \ '../vim-snippets/snippets'
  \ ], ',')

"
" fzf

" Set fzf command prefix.
let g:fzf_command_prefix = 'Fzf'

" Set default fzf command.
if executable('fzf') && executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

"
" Vim-polyglot

" Disable select language packs.
let g:polyglot_disabled = [
  \ 'latex'
  \ ]

" Load jsx syntax for normal javascript files.
let g:jsx_ext_required = 0

"
" Ruby

" Disable default ri.vim mappings.
let g:ri_no_mappings = 1
