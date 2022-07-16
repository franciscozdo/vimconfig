" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen load
call pathogen#infect()

" BASIC
set number
set wrap linebreak showbreak=ͱ
set showmatch           " highlight matching braces
set cursorline          "highlight current line
set incsearch
set mouse=a
set noshowmode
set showcmd             " display incomplete commands
set modeline
syntax on
filetype plugin indent on

" tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
let g:indenty_show_msg=0 " don't show message from plugin

" jump to last known line in file
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

let mapleader=" "

" THEMES
set background=dark
set colorcolumn=80
set t_Co=256
colorscheme gruvbox
set t_ut=
let g:rainbow_active=1

" lightline settings
set laststatus=2
source ~/.vim/lightline.vim

" SPLITTING
set splitright
set splitbelow
nnoremap = :vertical resize +5<cr>
nnoremap - :vertical resize -5<cr>

" TABS that space is necessary
nnoremap <leader>t :tabedit 
nnoremap <leader>n :tabn<cr>
nnoremap <leader>m :tabp<cr>

" CLIPBOARD
set clipboard=unnamedplus
noremap <leader>y "+y
noremap <leader>p "+p

" SPELL
set spelllang=pl,en

" Repair spellchecking highlighting
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=blue
hi SpellRare cterm=underline
hi SpellLocal cterm=underline

"Toggle spelling with spece + s
nnoremap <leader>s :call SpellToggle()<cr>
function! SpellToggle()
  if &spell
    setlocal nospell
  else
    setlocal spell
  endif
endfunction

" FILETYPES
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile *.he,*.she set filetype=helium
au FileType tex,gitcommit,markdown setlocal spell

"HISTORY, LOADING FILE, ETC.

" set UTF-8 encoding
set fileencoding=utf-8
set termencoding=utf-8

"directories for swap files, etc
set undodir=~/.vim/.undo,/tmp//
set directory=~/.vim/.swp//,/tmp//
set backupdir=~/.vim/.backup//,/tmp//
set undofile
set autoread
set updatetime=1000
set backup
set history=50

" OTHER

" show whitespaces
set list
set listchars=tab:▸\ ,trail:·
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" apply changes from diff to second window
nnoremap <leader>p :diffput<cr>

" Directory Tree settings
noremap <leader>e :Lex<CR>
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=10
let g:netrw_keepdir=0

