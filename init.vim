set et sw=4 sts=4 nu

"============================================================
" Plug setup
"============================================================
"
" On new installations you'll have to manually install Plug:
" https://github.com/junegunn/vim-plug
"
" When adding plugins here, remember to run "so ~/.vimrc" or Space V R
" then run :PlugInstall
"

set nocompatible              " be iMproved, required
filetype off                  " required

" Required when running Fish shell
set shell=bash

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'

" Alignment plugin
" Select your block of text to align then enter :Tab /= to align, say, on the
" = sign. Don't forget the slash!
" More info here: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Show matching parens in different colors
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"------------------------------------------------------------
" JavaScript
"

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS syntax highlighting
Plug 'jelera/vim-javascript-syntax'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS indentation and syntax highlighting
" Note: required Vim 7.4 with patches 1-7. Check with :version to be sure.
Plug 'pangloss/vim-javascript'

"------------------------------------------------------------
" Clojure/ClojureScript
"

" Clojure REPL support
Plug 'tpope/vim-fireplace'

" Clojure support for Leiningen
Plug 'tpope/vim-salve'

" Clojure Syntastic checking
Plug 'venantius/vim-eastwood'

" Support for s-expressions
" Examples:
"
" yaf - Yank a form, e.g. everything inside the immediate (), [], or {}
" daF - Delete the current top-level form
" ==  - indents the current COMPOUND FORM without moving the cursor
" =-  - indents the current top-level COMPOUND FORM without moving the cursor
" ,i  - surround current form with parens
" ,o  - lift current form to replace parent form
" ,O  - lift current element to replace parent form
"
Plug 'guns/vim-sexp'
" disable auto insertion of matching parens
"let g:sexp_enable_insert_mode_mappings = 0

" from https://github.com/tpope/vim-sexp-mappings-for-regular-people
" Mnemonic: the arrow shows the way to move the paren
nmap <buffer> >(  <Plug>(sexp_emit_head_element)
nmap <buffer> <)  <Plug>(sexp_emit_tail_element)
nmap <buffer> <(  <Plug>(sexp_capture_prev_element)
nmap <buffer> >)  <Plug>(sexp_capture_next_element)

" Slamhound rewrites the ns declaration for Clojure namespaces
" It's like an "organize imports" for Clojure
" See the screencast here: https://vimeo.com/80650659
Plug 'guns/vim-slamhound'


"------------------------------------------------------------
" TypeScript
"

" Syntax highlighting
Plug 'leafgarland/typescript-vim'



" All the colorschemes!
Plug 'flazz/vim-colorschemes'

" New plugins to try
" https://github.com/msanders/snipmate.vim
" https://github.com/tpope/vim-fugitive (git client)
" https://github.com/mhinz/vim-signify (show diffs from git, also see gitgutter)
" https://github.com/Shougo/unite.vim (fuzzy search for things, apparently better than ctrlp)

" Fancy status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'

" Sane editing of Ansible YAML files
Plug 'chase/vim-ansible-yaml'

" GIT interface
Plug 'tpope/vim-fugitive'

" Requires silver searcher to be installed
" https://github.com/ggreer/the_silver_searcher
Plug 'rking/ag.vim'

" Deoplete autocompleter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" Use <tab> to cycle through proposals; <c-n> is too awkward
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Deoplete support for clojure
Plug 'clojure-vim/async-clj-omni'
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

call plug#end()

"============================================================
" General settings
"============================================================

" Sudo when needed
" From http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions
cmap w!! %!sudo tee > /dev/null %

" Respect modelines in files being edited
set modeline

syntax on
filetype plugin indent on
se t_Co=256

set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0

" highlight the line containing the cursor
set cursorline

"============================================================
" Key mappings
"============================================================

inoremap jj <Esc>
let mapleader = " "
let maplocalleader = ","

let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=60

" Normally, <c-w>v clones the current buffer
" This causes it to create a new, blank window to the right
set splitright
nnoremap <c-w>v :vnew<cr>

" Map omnicomplete to Ctrl-Space
inoremap <c-space> <c-x><c-o>


"============================================================
" File types
"============================================================

" See: http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup local

    autocmd!

    " Show filename in window title
    autocmd BufEnter * let &titlestring = expand("%:t") | set title

    " Tab and word-wrap settings
    autocmd BufRead,BufNewFile *.md,*.markdown,*.txt             set tw=72
    autocmd BufRead,BufNewFile *.md,*.markdown,*.txt             setlocal spell spelllang=en_ca
    autocmd BufRead,BufNewFile *.css,*.less,*.js,*.html,*.xml    set sw=2 sts=2
    autocmd FileType less set sw=2 sts=2
    autocmd FileType mail                                        set tw=72
    autocmd BufRead,BufNewFile *.cljc                            set ft=clojure
    autocmd BufRead,BufNewFile *.gv                              set ft=graphviz

    " Trim trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " In quickfix window, use Space to show file w/o changing windows
    autocmd FileType qf nnoremap <buffer> <space> <cr><c-w><c-p>

    " Local commands for Clojure
    autocmd FileType clojure nnoremap <buffer> <localleader>e :Eval<cr>
    autocmd FileType clojure nnoremap <buffer> <localleader>E :%Eval<cr>
    "autocmd FileType clojure nnoremap <buffer> <localleader>t :RunTests<cr>
    autocmd FileType clojure nnoremap <buffer> <localleader>t :w<cr>:Require<cr>:Eval (clojure.test/run-tests)<cr>

    " Eval clojure on save
    " This don't work so good:
    " - you have to type an addtional Enter after saving
    " - should exclude project.clj
    "autocmd BufWritePost *.clj,*.cljc         Require

    " Local commands for Markdown
    autocmd FileType markdown nnoremap <buffer> <localleader>v r✓

augroup END

"----------------------------------------
" SQL
"----------------------------------------
let g:sql_type_default = 'pgsql'

"----------------------------------------
" Clojure
"----------------------------------------

" Hit <f3> to go to symbol definition
au FileType clojure nnoremap <buffer> <f3> [<c-d>

"----------------------------------------
" XML
"----------------------------------------
"let g:xml_syntax_folding = 3
au FileType xml setlocal foldmethod=syntax foldlevel=9

"============================================================
" Search settings
"============================================================

set incsearch
set ignorecase
set smartcase
set scrolloff=2
set wildmode=longest,list

nnoremap <c-l> :noh<cr><c-l>

"============================================================
" Status line
"============================================================

" Always show the status line
set laststatus=2

"set statusline=%f  "filename relative to current directory
"set statusline+=%m "modified
"set statusline+=\ %y "type
""eol format and encoding
"set statusline+=\ [%{&ff},%{strlen(&fenc)?&fenc:'none'}]
""column
"set statusline+=\ C%c
""current line and total lines
"set statusline+=\ L%l/%L


"============================================================
" vim-fireplace mappings
"============================================================

"nnoremap <C-e> :Eval<cr>
"nnoremap <S-C-e> :%Eval<cr>

"============================================================
" Spacemacs/Spacevim inspired mappings
"
" Let this be the way forward!
"============================================================

"------------------------------------------------------------
" File commands SPC f...
"------------------------------------------------------------

nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>ff :NERDTreeFind<cr>

"------------------------------------------------------------
" Table commands SPC t...
"------------------------------------------------------------

nnoremap <leader>t\| :Tabularize /\|<cr>

"------------------------------------------------------------
" Vimrc commands SPC v...
"------------------------------------------------------------

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>

"------------------------------------------------------------
" Window commands SPC w...
"------------------------------------------------------------

" Jump to window
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" Move window
nnoremap <leader>wH <c-w>H
nnoremap <leader>wJ <c-w>J
nnoremap <leader>wK <c-w>K
nnoremap <leader>wL <c-w>L

nnoremap <leader>wm <c-w>o

nnoremap <leader>wn :new<cr>
nnoremap <leader>wv :vnew<cr>

nnoremap <leader>w= <c-w>=

"============================================================
" Plugins to try
" https://github.com/ctjhoa/spacevim/blob/master/PLUGINS.md
"============================================================
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'airblade/vim-gitgutter'
" https://github.com/jreybert/vimagit
" https://github.com/Shougo/unite.vim
" https://github.com/Shougo/denite.nvim
"
"============================================================
" Resources
"============================================================
" - http://learnvimscriptthehardway.stevelosh.com/
"
"

"============================================================
" External configs
"============================================================
runtime clojure.vim
