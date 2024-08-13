" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Add cursor relative number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set softtabstop to 0 spaces.
set softtabstop=0

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
" set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Enable mouse edit
set mouse=a

" Enable mouse popup
set mousemodel=popup

" Use the clipboards of vim and win
set clipboard+=unnamed

" Paste from a windows or from vim
set paste

" Visual selection automatically copied to the clipboard
set go+=a

" Enable autoindent.
set autoindent

" Set encoding to UTF-8
set encoding=UTF-8

" Set terminal GUI colors
set termguicolors


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin()

  " libs
  Plug 'ryanoasis/vim-devicons'

  " tools
  Plug 'preservim/nerdtree'
  Plug 'mg979/vim-visual-multi'

  " languages
  Plug 'sheerun/vim-polyglot'

  " themes
  Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
  Plug 'joshdick/onedark.vim'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" Set the backslash as the leader key.
let mapleader="\\"

" Switch Window
nnoremap <tab> :wincmd w<CR>
nnoremap ; :wincmd w<CR>
nnoremap <M-]> :wincmd w<CR>

" NerdTree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap , :NERDTreeToggle<CR>
nnoremap <M-[> :NERDTreeToggle<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" Set syntax on
syntax on

" Set default background color
set background=dark

" Set default theme color
colorscheme nightfly

" Set guicursor style in gVim
au VimEnter,VimResume * set guicursor=n-c:block,i-ci-ve:ver25,r-cr:hor10,o:hor50,v:hor10
  \,a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor
au VimLeave,VimSuspend * set guicursor=

" Set terminal cursor style on Vim
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
