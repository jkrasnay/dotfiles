" Yay, my first attempt at serious Vim customization
"
" Functions for helping with Clojure development.
"
" Requires vim-fireplace to be installed.
"
" Dev notes:
" - to reload run `:so %`


" Creates a namespace decl in the current buffer.
"
" Does not attempt to avoid an existing namespace decl.
"
function! clojure#ns_from_filename()
    let ns = substitute(expand('%'), '.*src/[^/]*/clj/\(.*\)\.clj[cs]\?', '\1', '')
    return tr(ns, '/_', '.-')
endfunction

function! clojure#ns_decl_from_filename()
    let ns = clojure#ns_from_filename()
    return '(ns ' . ns . '\n  (:require\n\n    ))'
endfunction

function! clojure#insert_ns_decl()
    :normal gg
    :put! =clojure#ns_decl_from_filename()
    :normal gg
    search(':require')
    :normal i
endfunction

function! clojure#open_test_ns()
    " TODO: magic vs. non-magic?
    " TODO: specify case-sensitive
    " TODO: open the test file beside the current one
    " TODO: switch back to non-test namespace?
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
    autocmd FileType clojure nnoremap <buffer> <LocalLeader>ns :call clojure#insert_ns_decl()<cr>
augroup END
