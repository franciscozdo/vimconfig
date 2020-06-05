"" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen load
call pathogen#infect()
call pathogen#helptags()

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands
set modeline

" set UTF-8 encoding
set fileencoding=utf-8
set termencoding=utf-8

" airline configuration (requires powerline font to be installed)
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" basic settings
set background=dark
"set textwidth=80
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=8
set expandtab
set number
set wrap linebreak
"set nowrap              " do not wrap long lines
set showmatch           " highlight matching braces
set cursorline          "highlight current line

" language settings
set spelllang=pl,en
set penc=latin2

nnoremap <space>s :call SpellToggle()<cr>

function! SpellToggle()
  if &spell
    setlocal nospell
  else
    setlocal spell
  endif
endfunction

" colorscheme
set t_Co=256
colorscheme rdark-terminal2
" Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
" https://sunaku.github.io/vim-256color-bce.html
set t_ut=

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

if has("cscope")
  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag

  " check cscope for definition of a symbol before checking ctags:
  " set to 1 if you want the reverse search order.
  set csto=0

  " add any cscope database in current directory
  if filereadable("cscope.out")
    cs add cscope.out  
  endif

  " show msg when any other cscope db added
  set cscopeverbose 

  " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
  " makes the vim window split horizontally, with search result displayed in
  " the new window.
  nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
endif

" tagbar settings
nnoremap <silent> <F8> :TagbarToggle<CR>

" Tag Highlighting settings
au BufEnter *.c,*.h silent call TagHighlight#ReadTypes#ReadTypesByOption()

" assembler setings
au BufEnter *.[sS] setlocal et sw=8 ts=8

" Makefile settings
au FileType make setlocal ts=8 sw=8 noet

" Unfold everything by default
au BufEnter * normal zR

" c & c++ settings
au FileType c,cpp setlocal foldmethod=syntax foldnestmax=1 cino=(0
let c_no_comment_fold = 1
let c_no_if0_fold = 1
let c_gnu = 1

au FileType tex,gitcommit setlocal spell

"I should use default shortcuts!!!
"split navigation CTRL + H/J/K/L
"nnoremap <C-J> <C-W><C-J> 
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"vsplit and split opens on rightside and on bottom 
set splitright
set splitbelow

"open in new tab and move between
map <C-T> :tabedit 
map <C-N> :tabn<cr>
map <C-P> :tabp<cr>

"clipboard settings
set clipboard=unnamedplus
noremap <Leader>y "+y
noremap <Leader>p "+p

set mouse=a

"HISTORY, LOADING FILE, ETC.

"directories for swap files, etc
set undodir=~/.vim/.undo
set directory=~/.vim/.swp
set backupdir=~/.vim/.backup
set undofile            "you can undo between different saves of file
set history=1000
set autoread            "auto reload file
set updatetime=1000

"unused
"
"function! GnuIndent()
"  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 
"  setlocal shiftwidth=2 
"  setlocal tabstop=8 
"  setlocal noexpandtab
"endfunction 

" fricas settings
"au BufNewFile,BufRead *.spad,*.input set filetype=axiom
"au BufEnter *.boot setlocal filetype=axiom tabstop=8 shiftwidth=8 softtabstop=8
"au BufNewFile,BufRead *.input *.spad exe "source ~/.vim/syntax/axiom.vim"franZ vimrc
