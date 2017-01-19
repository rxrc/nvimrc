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
  let g:python3_host_prog = $VIM_PYTHON3
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

" Disable promptline and tmuxline extensions.
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0

" Themes and Colors
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'jnurmine/zenburn'

"
" Editor
"

" Syntax
Plug 'cohama/lexima.vim'
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

" Lists
Plug 'milkypostman/vim-togglelist'

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
Plug 'shougo/neoinclude.vim'
Plug 'sirver/ultisnips'
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

" Language Groups
let language_groups = {
  \ 'web': ['css', 'html', 'html.handlebars', 'tag',
  \         'javascript.jsx', 'liquid', 'sass', 'scss']
  \ }

" Vim-polyglot
Plug 'sheerun/vim-polyglot'

" API Blueprint
Plug 'kylef/apiblueprint.vim',
     \ { 'for': 'apiblueprint' }

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

Plug 'severeoverfl0w/async-clj-omni',
     \ { 'for': 'clojure' }

" Flow
Plug 'flowtype/vim-flow',
     \ { 'for': 'javascript' }

" Haskell
Plug 'bitc/vim-hdevtools',
     \ { 'for': 'haskell' }

" JavaScript
Plug 'isruslan/vim-es6',
     \ { 'for': 'javascript' }

Plug 'ternjs/tern_for_vim',
     \ { 'for': 'javascript' }

Plug 'carlitux/deoplete-ternjs',
     \ { 'for': 'javascript' }

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
" Riot
Plug 'ryym/vim-riot',
     \ { 'for': 'riot' }

" Ruby
Plug 'tpope/vim-rbenv',
     \ { 'for': 'ruby' }

Plug 'tpope/vim-bundler',
     \ { 'for': 'ruby' }

Plug 'danchoi/ri.vim',
     \ { 'for': 'ruby' }

Plug 'fishbullet/deoplete-ruby',
     \ { 'for': 'ruby' }

" TypeScript
Plug 'mhartington/deoplete-typescript',
     \ { 'for': 'typescript' }

" Web
Plug 'othree/csscomplete.vim',
     \ { 'for': language_groups['web'] }

Plug 'mattn/emmet-vim',
     \ { 'for': language_groups['web'] }

"
" vim-airline

" Disable Powerline.
let g:powerline_loaded = 1

" Use Powerline fonts for vim-airline.
let g:airline_powerline_fonts = 1

" Enable tabline.
let g:airline#extensions#tabline#enabled = 1

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

" Complete file paths relative to the current buffer.
let g:deoplete#file#enable_buffer_path = 1

" Initialize deoplete globals.
if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif

if !exists('g:deoplete#sources')
  let g:deoplete#sources = {}
endif

if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif

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

" Enable syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

"
" Ruby

" Disable default ri.vim mappings.
let g:ri_no_mappings = 1
