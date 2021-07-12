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
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

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
Plug 'tpope/vim-abolish'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Clipboard
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'

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

" ALE
Plug 'w0rp/ale'

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
" Language Interfaces
"

" Language Groups
let language_groups = {
  \ 'javascript': ['javascript', 'javascript.jsx'],
  \ 'web': ['css', 'html', 'html.handlebars', 'tag',
  \         'javascript', 'javascript.jsx', 'liquid', 'mjml', 'sass', 'scss']
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

" GraphQL
Plug 'jparise/vim-graphql'

" Haskell
Plug 'bitc/vim-hdevtools',
     \ { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc',
     \ { 'for': 'haskell' }

" JavaScript
Plug 'isruslan/vim-es6',
     \ { 'for': language_groups['javascript'] }

" LaTeX
Plug 'lervag/vimtex',
     \ { 'for': 'tex' }

" Python
Plug 'tmhedberg/simpylfold',
     \ { 'for': 'python' }

"
" Markdown
Plug 'tpope/vim-markdown'

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

" Terraform
Plug 'hashivim/vim-terraform',
     \ { 'for': 'terraform' }

Plug 'juliosueiras/vim-terraform-completion',
     \ { 'for': 'terraform' }

"
" Web
Plug 'othree/csscomplete.vim',
     \ { 'for': language_groups['web'] }

Plug 'mattn/emmet-vim',
     \ { 'for': language_groups['web'] }

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

" Enable ALE.
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
  \ 'json': ['jq']
  \ }

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
" oceanic-next
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

"
" Sneak
let g:sneak#label = 1

"
" vim-signature

" Set signature leader.
let g:SignatureMap = { 'Leader': "\<Leader\>;" }

"
" vim-commentary

" Disable \\ commentary maps.
let g:commentary_map_backslash = 0

"
" vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:better_whitespace_operator = ''
let g:strip_whitespace_confirm = 0

"
" GitGutter

"
" github-issues

" Load GitHub personal access token.
let g:github_access_token_file =
  \ $XDG_CONFIG_HOME . '/github/tokens/github-issues.vim'
if filereadable(g:github_access_token_file)
  let g:github_access_token = readfile(g:github_access_token_file)[0]
endif

" Load GitHub issues asynchronously.
let g:gissues_lazy_load = 1
let g:gissues_async_omni = 1

" thesaurus_query.vim
let g:tq_map_keys = 0

"
" fzf

" Set fzf command prefix.
let g:fzf_command_prefix = 'Fzf'

" Set default fzf command.
if executable('fzf')
  if empty($IGNORE_FILE)
    let s:ignore_file = $HOME. '/.ignore'
  else
    let s:ignore_file = $IGNORE_FILE
  endif

  if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --path-to-ignore ' . s:ignore_file . ' -g ""'
  endif

  if executable('rg')
    let $FZF_DEFAULT_COMMAND =
      \ 'rg --files --smart-case --hidden --follow --ignore-file ' . s:ignore_file
  endif
endif

"
" Vim-polyglot

" Disable select language packs.
let g:polyglot_disabled = [
  \ 'latex'
  \ ]

"
" Haskell
let g:necoghc_use_stack = 1

"
" Ruby

" Disable default ri.vim mappings.
let g:ri_no_mappings = 1

"
" Yoink.vim
let g:yoinkMaxItems = 20
let g:yoinkSavePersistently = 1
let g:yoinkSwapClampAtEnds = 0
let g:yoinkIncludeDeleteOperations = 1
