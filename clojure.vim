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

function! clojure#ns_decl()

    let filename = expand('%')
    let ns = clojure#ns_from_filename()
    let result = ['(ns ' . ns, '  (:require']

    if filename =~ "_test"
        call add(result, '    [clojure.test :refer [deftest is]]')
    endif

    if filename =~ "\.cljs$"
        call add(result, '    [re-frame.core :as rf]')
    endif

    call add(result, '    ))')
    return result

endfunction

function! clojure#insert_ns_decl()
    :normal gg
    :put! =clojure#ns_decl_from_filename()
    :normal gg
    search(':require')
    :normal i
endfunction

" Returns the name of the corresponding test file of the current Clojure file
function! clojure#test_file()
    " TODO: magic vs. non-magic?
    " TODO: specify case-sensitive
    " TODO: open the test file beside the current one
    " TODO: switch back to non-test namespace?
    let f1 = substitute(expand('%'), '\.clj[cs]\?', '_test&', '')
    return substitute(f1, 'src/main', 'src/test', '')
endfunction

command! ClojureGoToTest exec ':vnew ' . clojure#test_file()
command! ClojureInsertComment exec 'normal i;;<esc>60a=<esc>o;; <enter>;;<esc>k' | startinsert!
command! ClojureInsertNs call append(0, clojure#ns_decl())
command! ClojureClearNs exec 'Eval (doseq [x (keys (ns-interns *ns*))] (ns-unmap *ns* x))'
command! CljsRepl exec 'CljEval (figwheel.main.api/cljs-repl "dev")'

augroup clojure
    autocmd!

    autocmd FileType clojure nnoremap <buffer> <localleader>e :Eval<cr>
    autocmd FileType clojure nnoremap <buffer> <localleader>E :%Eval<cr>
    autocmd FileType clojure nnoremap <buffer> <localleader>R :ClojureClearNs<cr>:%Eval<cr>
    "autocmd FileType clojure nnoremap <buffer> <localleader>t :RunTests<cr>
    autocmd FileType clojure nnoremap <buffer> <localleader>t :w<cr>:Require<cr>:Eval (clojure.test/run-tests)<cr>

    autocmd FileType clojure nnoremap <buffer> <LocalLeader>gt :ClojureGoToTest<cr>
    autocmd FileType clojure nnoremap <buffer> <LocalLeader>c :ClojureInsertComment<cr>
    autocmd FileType clojure nnoremap <buffer> <LocalLeader>n :ClojureInsertNs<cr>
    autocmd BufNewFile *.clj call append(0, clojure#ns_decl())
augroup END

