" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen load
call pathogen#infect()
call pathogen#helptags()

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands
set noshowmode          " don't show current mode (i have it in airline)
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

source ~/.vim/latex_helpers.vim

"vsplit and split opens on rightside and on bottom 
set splitright
set splitbelow

"open in new tab and move between
map <space>t :tabedit 
map <space>n :tabn<cr>
map <space>p :tabp<cr>

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
