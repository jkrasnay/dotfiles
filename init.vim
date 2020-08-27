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
set lazyredraw                " improves Clojure editing format

" Required when running Fish shell
set shell=bash

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'

" Ctrl-P plug-in
"
" Search for files using ctrl-P
"
Plug 'ctrlpvim/ctrlp.vim'
" Use git to search files. Respects .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Alignment plugin
" Select your block of text to align then enter :Tab /= to align, say, on the
" = sign. Don't forget the slash!
" More info here: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Show matching parens in different colors
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Show menu of completions of multi-keystroke mappings
Plug 'liuchengxu/vim-which-key'

" Improved bullet handling for Asciidoc docs
" Still doesn't work great:
" - on word wrap in a bullet item, text is not indented
" - hitting `gq` on a selection with * bullet causes the bullet to
"   repeat, at least in Asciidoc. I think this is b/c vim thinks it's
"   a comment. set formatoptions-=cro does not seem to help.
"
" This helps with single-level indents:
" http://www.methods.co.nz/asciidoc/chunked/ch36.html#X61
"
" This hijacks the Enter key on autocomplete. Disabled for now.
"Plug 'dkarter/bullets.vim'
"let g:bullets_enabled_file_types = [
"    \ 'markdown',
"    \ 'text',
"    \ 'gitcommit',
"    \ 'scratch',
"    \ 'asciidoc'
"    \]

" <c-w>o to zoom window to full size, again to restore previous layout
" Nice thought but...
" - prints a bunch of errors when zooming
" - slow when un-zooming (~3 seconds)
"Plug 'vim-scripts/ZoomWin'

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
"Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure', {'tag': 'v4.3.1'}

" Clojure support for Leiningen
"
" I think this starts a JVM with Clojure if you don't already have an nrepl
" running. Not needed and potentially confusing.
"
"Plug 'tpope/vim-salve'

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
" Fennel
"
Plug 'bakpakin/fennel.vim'


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
" When enabled, adds a short pause after typing each space.
" This can be very distracting!
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('auto_complete_delay', 200)

" Map omnicomplete to Ctrl-Space
inoremap <c-space> <c-x><c-o>


" Async Linter support
"
" Also run: brew install candid82/brew/joker
"           brew install borkdude/brew/clj-kondo
"
" These are automatically recognized by ALE
"
Plug 'w0rp/ale'

" Disable Joker linting
let g:ale_linters = {'clojure': ['clj-kondo']}

" Database
"
" You need to have a PostgreSQL client installed:
"
"   brew install libpq
"   brew link --force libpq
"
" Normal usage: select a range, then type :DB to eval it against the server.
"
" See https://github.com/tpope/vim-dadbod/blob/master/doc/dadbod.txt
"
Plug 'tpope/vim-dadbod'

let g:db = 'postgresql://erbium:password@localhost/'

" Show autocomplete preview in NeoVim's floating window
"
" Requires Neovim 0.4
"
" Found via https://oli.me.uk/getting-started-with-clojure-neovim-and-conjure-in-minutes/
"
Plug 'ncm2/float-preview.nvim'
set completeopt-=preview
let g:float_preview#docked = 1
let g:float_preview#max_width = 120
let g:float_preview#max_height = 40

" Write plugins in Fennel, a Clojure-like LISP that compiles to Lua
Plug 'Olical/aniseed', { 'tag': 'v3.6.1' }

" Snippets editor
"
" Snippets are in files under ~/.config/nvim/UltiSnips, which is managed by my
" dotfiles project. They are immediately loaded upon save.
"
Plug 'SirVer/ultisnips'

" Vim Wiki
"
" <leader>ww to open the wiki
Plug 'vimwiki/vimwiki'

call plug#end()

" FuzzyFinder
" Need to run 'brew install fzf'
" Also, need to set this in ~/.bash_profile:
"
" export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
"
" (this is part of my dotfiles repo)
"
set rtp+=/usr/local/opt/fzf

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
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

cnoremap <c-a> <home>
cnoremap <c-e> <end>

let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=60

" Normally, <c-w>v clones the current buffer
" This causes it to create a new, blank window to the right
set splitright
nnoremap <c-w>v :vnew<cr>

" Must call after plug#end()
" Stops deoplete from slowing down my typing
call deoplete#custom#option('auto_complete_delay', 200)

" In visual mode, Y copies to the system keyboard
vmap Y "+y

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
    autocmd BufRead,BufNewFile *.css,*.less,*.scss,*.js,*.html,*.xml    set sw=2 sts=2
    autocmd FileType less set sw=2 sts=2
    autocmd FileType mail                                        set tw=72
    autocmd BufRead,BufNewFile *.cljc                            set ft=clojure
    autocmd BufRead,BufNewFile *.gv                              set ft=graphviz

    " Trim trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " In quickfix window, use Space to show file w/o changing windows
    autocmd FileType qf nnoremap <buffer> <space> <cr><c-w><c-p>

    " Local commands for Markdown
    autocmd FileType markdown nnoremap <buffer> <localleader>v r✓

augroup END

"----------------------------------------
" SQL
"----------------------------------------
let g:sql_type_default = 'pgsql'

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
" Convenience Key Mappings
"============================================================

" Clear highlight with \ (opposite of /)
nnoremap \ :noh<cr>

" Mappings to quickly move through the results
"
" If a popup menu is visible (e.g. via autocomplete) then these
" move between entries, else moves between the results in the
" quickfix window, such as that shown by :Ag.
inoremap <expr> <C-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <C-k> pumvisible() ? "\<c-p>" : "\<c-k>"
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

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
nnoremap <leader>fz :FZF<cr>

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

nnoremap <leader>wo <c-w>o

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
runtime notes.vim
