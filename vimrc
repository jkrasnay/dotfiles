set et sw=4 sts=4 nu

"============================================================
" Vundle setup
"============================================================

" NOTE: INSTALL VUNDLE OR YOU'LL SEE VIM STARTUP ERRORS
" See here: https://github.com/gmarik/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"
" When adding plugins here, remember to run "so ~/.vimrc" and :PluginInstall" afterwards
"
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'HTML-AutoCloseTag'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-markdown'
Plugin 'marijnh/tern_for_vim'
Plugin 'altercation/vim-colors-solarized'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS indentation and syntax highlighting
" Note: required Vim 7.4 with patches 1-7. Check with :version to be sure.
Plugin 'pangloss/vim-javascript'

" Tabular alignment plugin
" Put your cursor in the block and run the Tab command to align on the given
" regex, e.g. `:Tab /|` to align pipes, `:Tab /=` to align equals signs
Plugin 'godlygeek/tabular'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Auto-types matching brackets, quotes, etc.
"Plugin 'Raimondi/delimitMate' " This is just annoying, as you have to hit the delimiter anyway
" Adds an extra line when hitting CR between braces
"let delimitMate_expand_cr = 1

" All the colorschemes!
"Plugin 'flazz/vim-colorschemes'

" New plugins to try
" https://github.com/msanders/snipmate.vim
" https://github.com/tpope/vim-fugitive (git client)
" https://github.com/mhinz/vim-signify (show diffs from git, also see gitgutter)
" https://github.com/Shougo/unite.vim (fuzzy search for things, apparently better than ctrlp)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
set background=light
colorscheme solarized
let g:solarized_termcolors=256
"Not sure if the setting below is still required, given the setting above
se t_Co=16


"============================================================
" Key mappings
"============================================================

inoremap jj <Esc>
let mapleader = ","

" Reformat the current paragraph
nmap Q gqap

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>d :TernDef<CR>

"============================================================
" File types
"============================================================

au BufRead,BufNewFile *.md,*.markdown,*.txt             set tw=72
au BufRead,BufNewFile *.css,*.less,*.js,*.html,*.xml    set sw=2 sts=2
au FileType mail                                        set tw=72

let g:sql_type_default = 'pgsql'


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


