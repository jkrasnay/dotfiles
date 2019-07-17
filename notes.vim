" Notes module for Vim
"

function! notes#notes_dir()
    return expand('~/Dropbox/Notes') . strftime('/%Y/%m')
endfunction

function! notes#notes_file()
    return notes#notes_dir() . "/index.adoc"
endfunction

function! notes#heading()
    return strftime('== %Y-%m-%d')
endfunction

function! notes#open_notes_file()
    call mkdir(notes#notes_dir(), 'p')
    exec ':vnew ' . notes#notes_file()
    if search(notes#heading())
        exec 'normal G'
    else
        exec 'normal Go' . notes#heading() . ''
    endif
endfunction

command! Notes call notes#open_notes_file()
