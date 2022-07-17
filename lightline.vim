
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active' : {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'spell' ],
  \             [ 'filename' ] ],
  \   'right':[ [ 'lineinfo' ],
  \             [ 'tabstop', 'fileencoding' ],
  \             [ 'filetype' ] ]
  \ },
  \ 'component_function' : {
  \   'gitbranch': 'gitbranch#name',
  \   'spell': 'LightlineSpell',
  \   'filename': 'LightlineFilename',
  \   'lineinfo': 'LightlineLocation',
  \   'tabstop': 'LightlineTabstop',
  \   'filetype': 'LightlineFiletype',
  \ },
  \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

function LightlineFilename()
  let rdonly = &readonly ? '[RO] ' : ''
  let filename = @% !=# '' ? @% : '[No Name]'
  let modified = &modified ? ' +' : ''
  return rdonly . filename . modified
endfunction

function LightlineFiletype()
  return winwidth(0) > 60 ? (&filetype !=# '' ? &filetype : 'plain') : ''
endfunction

function LightlineSpell()
  return &spell ? 'SPELL[' . &spelllang . ']' : ''
endfunction

function LightlineTabstop()
  let tstop = &tabstop
  let expand = &expandtab ? '+' : ''
  return 'ts=' . tstop . expand
endfunction

function LightlineLocation()
  let line = line('.')
  let total = line('$')
  let col = col('.')
  return 'L:' . line . '/' . total . ' C:' . col
endfunction
