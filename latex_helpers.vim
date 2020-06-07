" begin environment
command -nargs=1 EnvComplete s/xxx/<args>/2
nnoremap <space>b A<CR>\begin{xxx}<CR>\end{xxx}<ESC>k0:EnvComplete 

"inline math
nnoremap <space>m i\(\)<ESC>hi

"newline math
nnoremap <space>M A<CR>\[<CR><CR>\]<ESC>ki

