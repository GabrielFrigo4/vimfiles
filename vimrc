" DEFAULT ---------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Load an indent file for the detected file type.
filetype indent on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Enable plugins and load plugin for indent the detected file type.
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Set buffer to not readonly
set noreadonly

" Set buffer to modifiable
set modifiable

" Disable the creation of swap files
set noswapfile

" Add numbers to each line on the left-hand side.
set number

" Add cursor relative number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Make the backspace work normally
set backspace+=indent,eol,start

" Make h,l,<left>,<right> work normally
set whichwrap+=<,>,h,l,[,]

" Set softtabstop to 4 spaces.
set softtabstop=4

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space tabs instead of characters.
set noexpandtab

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
set clipboard^=unnamed,unnamedplus

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

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

" Disable Vim-Polyglot [ADA]
let g:polyglot_disabled = ['ada']

call plug#begin()

    " libs
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-speeddating'
    Plug 'junegunn/fzf.vim'

    " tools
    Plug 'mg979/vim-visual-multi'
    Plug 'girishji/scope.vim'
    Plug 'preservim/nerdtree'
    Plug 'mattn/calendar-vim'

    " languages
    Plug 'sheerun/vim-polyglot'
    Plug 'jceb/vim-orgmode'
    Plug 'thindil/vim-ada'

    " assembly
    Plug 'GabrielFrigo4/fasm.vim'
    Plug 'kylelaker/riscv.vim'
    Plug 'ARM9/arm-syntax-vim'

    " themes
    Plug 'tomasiser/vim-code-dark'

    " vim-scripts
    Plug 'vim-scripts/utl.vim'
    Plug 'vim-scripts/repeat.vim'
    Plug 'vim-scripts/taglist.vim'
    Plug 'vim-scripts/Tagbar'
    Plug 'vim-scripts/speeddating.vim'
    Plug 'vim-scripts/NrrwRgn'
    Plug 'vim-scripts/pathogen.vim'
    Plug 'vim-scripts/SyntaxRange'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

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

" Scope
nnoremap <C-s>f <ESC>:Scope File<CR>
nnoremap <C-s>g <ESC>:Scope Grep<CR>
nnoremap <C-s>b <ESC>:Scope Buffer<CR>
nnoremap <C-s>t <ESC>:Scope Tag<CR>

" Backspace in normal mode
nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable code folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Set default background color
set background=dark

" Set default theme color
colorscheme codedark

" Set guicursor style in gVim
au VimEnter,VimResume * set guicursor=n-c:block,i-ci-ve:ver25,r-cr:hor10,o:hor50,v:hor10
    \,a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor
au VimLeave,VimSuspend * set guicursor=

" Set terminal cursor style on Vim
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" MANPAGER
runtime! ftplugin/man.vim

" }}}


" LANGUAGE SETUP ------------------------------------------------------------ {{{

" Tab Fixed
au BufNewFile,BufRead *.org,*.norg,*.py,*.pyw,*.lua,*.wlua,*.rs,*.zig
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup RISC-V
au BufNewFile,BufRead *.riscv,*.rinc,*.RISCV,*.RINC
    \ set filetype=riscv |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup ARM
au BufNewFile,BufRead *.arm,*.ainc,*.ARM,*.AINC
    \ set filetype=arm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup X86 / X64
au BufNewFile,BufRead *.x86,*.x64,*.xinc,*.X86,*.X64,*.Xinc
    \ set filetype=nasm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup NASM
au BufNewFile,BufRead *.nasm,*.ninc
    \ set filetype=nasm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup FASM
au BufNewFile,BufRead *.fasm,*.finc
    \ set filetype=fasm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup MASM
au BufNewFile,BufRead *.masm,*.minc
    \ set filetype=masm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup GAS
au BufNewFile,BufRead *.gas,*.ginc
    \ set filetype=asm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" Setup ASM
au BufNewFile,BufRead *.s,*.i,*.S,*.I,*.asm,*.inc
    \ set filetype=nasm |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent

" }}}
