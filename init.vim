set et sw=4 sts=4 nu

"============================================================
" Vundle setup
"============================================================

" NOTE: INSTALL VUNDLE OR YOU'LL SEE VIM STARTUP ERRORS
" See here: https://github.com/gmarik/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" Required when running Fish shell
set shell=bash

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

call plug#begin('~/.local/share/nvim/plugged')

"
" When adding plugins here, remember to run "so ~/.vimrc" and :PluginInstall" afterwards
"
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-markdown'

" Alignment plugin
" Select your block of text to align then enter :Tab /= to align, say, on the
" = sign. Don't forget the slash!
" More info here: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Syntax coloring for LessCSS
Plug 'groenewege/vim-less'

" Shows pipe chars for indented lines
" Disabled cuz it looks terrible in Clojure
"Plug 'Yggdroot/indentLine'

" Show matching parens in different colors
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"------------------------------------------------------------
" Javascript
"

" Requires a external build step.
" See: https://github.com/Valloric/YouCompleteMe
"Plug 'Valloric/YouCompleteMe'

"Plug 'marijnh/tern_for_vim'

Plug 'altercation/vim-colors-solarized'
Plug 'vinitkumar/vim-tomorrow-theme'

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
"
Plug 'guns/vim-sexp'
" disable auto insertion of matching parens
let g:sexp_enable_insert_mode_mappings = 0

" Slamhound rewrites the ns declaration for Clojure namespaces
" It's like an "organize imports" for Clojure
" See the screencast here: https://vimeo.com/80650659
Plug 'guns/vim-slamhound'





" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Auto-types matching brackets, quotes, etc.
"Plug 'Raimondi/delimitMate' " This is just annoying, as you have to hit the delimiter anyway
" Adds an extra line when hitting CR between braces
"let delimitMate_expand_cr = 1

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

" Syntax coloring for Terraform files
Plug 'vim-scripts/vim-terraform'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required

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

"colorscheme solarized
"set background=light
"let g:solarized_termcolors=256

"colorscheme Tomorrow
"set background=light
"highlight LineNr ctermbg=LightGrey
"let g:colors_name="Tomorrow-Night-Bright"

set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0

" highlight the line containing the cursor
set cursorline

"============================================================
" Key mappings
"============================================================

inoremap jj <Esc>
let mapleader = ","

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=60

" ,d to show the TernDef definition
" TODO make this specific to Javascript
nnoremap <Leader>d :TernDef<CR>

" ,ev to quick-edit my .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" ,sv to re-source my .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

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

    " Trim trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " In quickfix window, use Space to show file w/o changing windows
    autocmd FileType qf nnoremap <buffer> <space> <cr><c-w><c-p>

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
let g:xml_syntax_folding = 1
au FileType xml setlocal foldmethod=syntax

"============================================================
" Search settings
"============================================================

set incsearch
set ignorecase
set smartcase
set scrolloff=2
set wildmode=longest,list

" Inserts a code block when editing Markdown
" TODO figure out how to only enable this when in Markdown mode
"command -nargs=1 Code :normal i{% highlight <args> %}<Enter><Enter>{% endhighlight %}<Up>


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

nnoremap <C-e> :Eval<cr>
nnoremap <S-C-e> :%Eval<cr>



"============================================================
" Resources
"============================================================
" - http://learnvimscriptthehardway.stevelosh.com/
"
"

