" Use atomic updates.
set backupcopy=yes

" Enable persistent undo history.
set undofile

" Hide buffers instead of closing them.
set hidden

" Open splits below by default.
set splitbelow

" Show line numbers.
set number

" Always show the sign column.
set signcolumn=yes

" Set nonzero scrolloff.
set scrolloff=3

" Set indentation preferences.
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Set search preferences.
set ignorecase
set smartcase

" Set folding preferences.
set foldmethod=syntax
set nofoldenable

" Disable bell and visual bell.
set noerrorbells visualbell t_vb=

" Set default autocompletion behavior.
set completeopt+=noinsert

" Hide some autocompletion messages.
set shortmess+=c

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete

" Set default tex flavor.
let g:tex_flavor='latex'

" Set WildMenu preferences.
set wildmode=longest:full,full
