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

" auto reload file when changed
set autoread
au CursorHold * checktime  

" set UTF-8 encoding
set fileencoding=utf-8
set termencoding=utf-8

" airline configuration (requires powerline font to be installed)
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" basic settings
set background=dark
set textwidth=98
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=8
set expandtab
set nu "rnu "set number relativenumber
set wrap linebreak
set showmatch           " highlight matching braces
set cursorline          "highlight current line
set incsearch
set mouse=a

syntax on
filetype plugin indent on

"vsplit and split opens on rightside and on bottom 
set splitright
set splitbelow

"HISTORY, LOADING FILE, ETC.

"directories for swap files, etc
set undodir=~/.vim/.undo,/tmp//
set directory=~/.vim/.swp//,/tmp//
set backupdir=~/.vim/.backup//,/tmp//
set undofile            "you can undo between different saves of file
set history=1000
set autoread            "auto reload file
set updatetime=1000
" language settings
set spelllang=pl,en


" colorscheme
set t_Co=256
colorscheme gruvbox
" Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
" https://sunaku.github.io/vim-256color-bce.html
set t_ut=

"Repair spellchecking highlithing
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=blue
hi SpellRare cterm=underline
hi SpellLocal cterm=underline

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

au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile *.he,*.she set filetype=helium
au BufRead,BufNewFile *.ejs set filetype=html
au FileType tex,gitcommit setlocal spell


" my commands
let mapleader = " " 

nnoremap <leader>s :call SpellToggle()<cr>
function! SpellToggle()
  if &spell
    setlocal nospell
  else
    setlocal spell
  endif
endfunction

source ~/.vim/latex_helpers.vim

"open in new tab and move between
nnoremap <leader>t :tabedit 
nnoremap <leader>n :tabn<cr>
nnoremap <leader>m :tabp<cr>

nnoremap = :vertical resize +5<cr> 
nnoremap - :vertical resize -5<cr>

nnoremap <leader>e :Lex<cr>:vertical resize 30<cr>

"clipboard settings
set clipboard=unnamedplus
noremap <leader>y "+y
noremap <leader>p "+p
