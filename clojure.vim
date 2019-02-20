" Yay, my first attempt at serious Vim customization
"
" Functions for helping with Clojure development.
"
" Requires vim-fireplace to be installed.
"
" Dev notes:
" - to reload run `:so %`


function! clojure#open_test_ns()
    " TODO: magic vs. non-magic?
    " TODO: specify case-sensitive
    let f1 = substitute(expand('%'), '\.clj[cs]\?', '_test&', '')
    let f2 = substitute(f1, 'src/main', 'src/test', '')
    "echom f2
    " TODO following doesn't work, opens file literally called 'f2'
    "edit f2
    execute "edit " . f2
endfunction


augroup clojure
    autocmd!
    autocmd FileType clojure nnoremap <buffer> <LocalLeader>gt :call clojure#open_test_ns()<cr>
augroup END
