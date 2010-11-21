set et sw=4 sts=4 nu

syntax on
filetype plugin indent on
set background=light

au BufRead,BufNewFile *.markdown,*.txt      set tw=72
au BufRead,BufNewFile *.css,*.html,*.xml    set sw=2 sts=2
au FileType mail                            set tw=72

" Reformat the current paragraph
nmap Q gqap

" Perform an Ant build in the current directory
nmap <f5> :wa<Enter>:!ant<Enter>

" Delete from the current line to the end of the buffer
nnoremap <S-C-j> :.,$d<Enter>

