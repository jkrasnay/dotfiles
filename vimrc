set et sw=4 sts=4 nu
nmap Q gqap

autocmd BufRead *.markdown set ai tw=78

syntax on
filetype plugin indent on

au BufRead,BufNewFile *.markdown            set tw=72
au BufRead,BufNewFile *.css,*.html,*.xml    set sw=2 sts=2

nmap <f5> :wa<Enter>:!ant<Enter>

command Trim % s/\s\+$//

