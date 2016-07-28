" Add aliases for consistent behavior of ctrl-space.
nmap <NUL> <C-Space>
imap <NUL> <C-Space>
cmap <NUL> <C-Space>

" Map enter to escape in insert mode.
inoremap <CR> <Esc>

" Use ctrl-enter or shift-enter to split lines in normal mode.
nmap <C-CR> i<C-CR><Esc>
nmap <S-CR> i<C-CR><Esc>

" Use enter to open command-line mode.
nnoremap <CR> :
vnoremap <CR> :

" Fix enter behavior in quickfix and command-line windows.
augroup cr-local-mappings
  autocmd!
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd CmdwinLeave * nnoremap <CR> :
augroup END

" Use q and Q for ge and gE.
nmap q ge
vmap q ge
omap q ge
nmap Q gE
vmap Q gE
omap Q gE

" Map U to redo and <C-R> to U.
nnoremap U <C-R>
nnoremap <C-R> U

" Swap ` with '.
nnoremap ` '
vnoremap ` '
nnoremap ' `
vnoremap ' `

" Make & behave like &&.
nnoremap <silent> & :<C-U>&&<CR>
xnoremap <silent> & :<C-U>&&<CR>

" Allow shift-escape to open and close command-line window.
nnoremap <S-Esc> q:
augroup command-line-local-mappings
  autocmd!
  autocmd CmdwinEnter * nnoremap <silent> <S-Esc> :<C-U>q<CR>
  autocmd CmdwinLeave * nnoremap <S-Esc> q:
  autocmd CmdwinEnter * vnoremap <silent> <S-Esc> :<C-U>q<CR>
  autocmd CmdwinLeave * vnoremap <S-Esc> q:
augroup END

" Use ctrl-h and ctrl-l to navigate command input.
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>

" Use ctrl-k and ctrl-j to navigate command history.
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>

" Provide alternate mapping for q since it is overridden above.
nnoremap <Tab> q
nnoremap <Tab><Tab> qq<Esc>
vnoremap <Tab> q
vnoremap <Tab><Tab> qq

" Provide alternate mapping for tab.
nnoremap <C-Tab> <Tab>

" Add shortcut for @q.
nnoremap <C-Q> @q
vnoremap <C-Q> @q

" Add shortcut to toggle folds.
nnoremap <Leader><Leader> za

" Add shortcut to open external links.
nmap <Leader>x gx

" Add shortcuts to navigate out of the terminal.
tnoremap <C-CR> <C-\><C-N>
augroup neovim-terminal-mappings
  autocmd!
  autocmd TermOpen * tmap <buffer> <C-H> <C-\><C-N><C-H>
  autocmd TermOpen * tmap <buffer> <C-J> <C-\><C-N><C-J>
  autocmd TermOpen * tmap <buffer> <C-K> <C-\><C-N><C-K>
  autocmd TermOpen * tmap <buffer> <C-L> <C-\><C-N><C-W>
augroup END

" Add shortcuts to split the window.
nnoremap <silent> <Leader>h :<C-U>leftabove vsplit<CR>
nnoremap <silent> <Leader>l :<C-U>rightbelow vsplit<CR>
nnoremap <silent> <Leader>k :<C-U>leftabove split<CR>
nnoremap <silent> <Leader>j :<C-U>rightbelow split<CR>

" Add shortcuts to split the frame.
nnoremap <silent> <Leader>H :<C-U>topleft vsplit<CR>
nnoremap <silent> <Leader>L :<C-U>botright vsplit<CR>
nnoremap <silent> <Leader>K :<C-U>topleft split<CR>
nnoremap <silent> <Leader>J :<C-U>botright split<CR>

" Add shortcuts to open and close tabs.
nnoremap <silent> <Leader><Tab> :<C-U>tabnew<CR>
nnoremap <silent> <Leader><S-Tab> :<C-U>tabclose<CR>

" Add shortcuts to cycle through tabs.
nnoremap <C-,> gT
nnoremap <C-.> gt

" Add shortcuts to open command-line and search history windows.
nnoremap <Leader>: q:
vnoremap <Leader>: q:
nnoremap <Leader>/ q/
vnoremap <Leader>/ q/
nnoremap <Leader>? q?
vnoremap <Leader>? q?

" Add shortcut to clear highlighting until next search.
nnoremap <silent> <Leader>o :<C-U>nohlsearch<CR>

" Add shortcut for new.
nnoremap <silent> <Leader>n :<C-U>enew<CR>

" Add shortcut to force reload file.
nnoremap <silent> <Leader>E :<C-U>edit!<CR>

" Add shortcuts for update and force write.
nnoremap <silent> <Leader>s :<C-U>update<CR>
nnoremap <silent> <Leader>S :<C-U>write!<CR>

" Add shortcuts for quit.
nnoremap <silent> <Leader><CR> :<C-U>quit<CR>
vnoremap <silent> <Leader><CR> :<C-U>quit<CR>

" Add shortcuts for force quit and quit all.
nnoremap <silent> <Leader>q :<C-U>quitall<CR>
vnoremap <silent> <Leader>q :<C-U>quitall<CR>
nnoremap <silent> <Leader>Q :<C-U>quitall!<CR>
vnoremap <silent> <Leader>Q :<C-U>quitall!<CR>

" Add shortcut to paste from the expression register.
nnoremap <Leader>= :<C-U>put =

" Use <C-G> for M.
nnoremap <C-G> M

" Add shortcuts to moves lines up and down.
nnoremap <silent> <C-=> :<C-U>m .+1<CR>==
nnoremap <silent> <C--> :<C-U>m .-2<CR>==

" Adds mappings for the system clipboard.
function! SystemClipboardMappings(register, quiet)
  " Copy to system clipboard.
  exec 'nnoremap <Leader>c "' . a:register . 'y'
  exec 'vnoremap <Leader>c "' . a:register . 'y'
  exec 'nnoremap <Leader>C "' . a:register . 'Y'
  exec 'nnoremap <Leader>cc "' . a:register . 'yy'

  " Move to system clipboard.
  exec 'nnoremap <Leader>m "' . a:register . 'd'
  exec 'vnoremap <Leader>m "' . a:register . 'd'
  exec 'nnoremap <Leader>M "' . a:register . 'D'
  exec 'nnoremap <Leader>mm "' . a:register . 'dd'

  " Paste from system clipboard.
  exec 'nnoremap <Leader>p "' . a:register . 'p'
  exec 'nnoremap <Leader>P "' . a:register . 'P'

  " Substitute from the system clipboard with easyclip.
  exec 'nmap <C-;> "' . a:register . ':'
  exec 'nmap <C-;><C-;> "' . a:register . '::'

  " Save the newly mapped register.
  let g:mapped_system_clipboard = a:register

  if !a:quiet
    echo 'Setting system register to ' . a:register
  endif
endfunction

" Create the system clipboard mappings using the + register.
call SystemClipboardMappings('+', 1)

" Toggle system clipboard mappings between the + and * registers.
nnoremap <silent><expr> cop
  \ g:mapped_system_clipboard == '+' ?
  \ ":<C-U>call SystemClipboardMappings('*', 0)<CR>" :
  \ ":<C-U>call SystemClipboardMappings('+', 0)<CR>"

" Toggle colored column.
nnoremap <expr><silent> com
  \ &colorcolumn == '' ?
  \ ":<C-U> set colorcolumn=81<CR>" :
  \ ":<C-U> set colorcolumn=<CR>"
