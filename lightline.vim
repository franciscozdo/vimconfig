
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active' : {
  \   'left': [ [ 'mode', 'paste', 'readonly' ],
  \             [ 'gitbranch' ],
  \             [ 'filename' ] ],
  \   'right':[ [ 'lineinfo' ],
  \             [ 'tabstop', 'fileencoding' ],
  \             [ 'filetype' ] ]
  \ },
  \ 'component_function' : {
  \   'gitbranch': 'gitbranch#name',
  \   'filetype': 'LightlineFiletype',
  \   'filename': 'LightlineFilename',
  \   'tabstop': 'LightlineTabstop',
  \   'lineinfo': 'LightlineLocation',
  \ },
  \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

function! LightlineFilename()
  let filename = @% !=# '' ? @% : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFiletype()
  return winwidth(0) > 60 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function LightlineTabstop()
  let tstop = &tabstop
  let expand = &expandtab ? "+" : ""
  return "ts=" . tstop . expand
endfunction

function LightlineLocation()
  let line = line(".") + 1
  let total = line("$")
  let col = col(".")
  return "L:" . line . "/" . total . " C:" . col
endfunction

