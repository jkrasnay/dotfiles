set et sw=4 sts=4 nu

"============================================================
" Vundle setup
"============================================================

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"
" When adding plugins here, remember to run "so ~/.vimrc" and :BundleInstall" afterwards
"
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'HTML-AutoCloseTag'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-markdown'
Bundle 'marijnh/tern_for_vim'
Bundle 'altercation/vim-colors-solarized'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" Recommended by http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" Improves JS indentation and syntax highlighting
" Note: required Vim 7.4 with patches 1-7. Check with :version to be sure.
Bundle "pangloss/vim-javascript"

Bundle "godlygeek/tabular"

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


