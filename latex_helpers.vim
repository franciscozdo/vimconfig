" begin environment
command -nargs=1 EnvComplete s/xxx/<args>/2
nnoremap <leader>b A<CR>\begin{xxx}<CR>\end{xxx}<ESC>k0:EnvComplete 

"inline math
nnoremap <leader>m i\(\)<ESC>hi

"newline math
nnoremap <leader>M A<CR>\[<CR><CR>\]<ESC>ki

