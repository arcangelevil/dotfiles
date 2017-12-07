" First things first
set nocompatible        " This is vim not vi
set encoding=utf-8      " Always use utf-8
set modelines=0         " No modelines (embedded vimscript)
set backspace=indent,eol,start  " Backspace behaves conventionally
set ttyfast             " Use optimizations for fast consoles

" Config pathogen for neat plugin install in ~/.vim/bundle/
execute pathogen#infect()

" Filetype operations
syntax on               " Syntax enabled
filetype on             " Filetype detection
filetype indent on      " Filetype specific indentation
filetype plugin on      " Filetype specific plugins
" compiler ruby         " Enable compiler support

" Autocompletion
" set wildmode=longest:full
" set wildignore+=*.o,*~,.lo
" set complete-=i


" Indent and tabbing related settings
set smartindent         " Indentation is contextual
set autoindent          " Indentation happens automatically
set shiftround          " When shifting round indentations
set tabstop=4           " Length (in spaces) of a tab
set softtabstop=4       " Soft tab length
set shiftwidth=4        " When shiffting move this amount of spaces
set expandtab           " Convert tabs to the correct number of spaces
set smarttab            " Tab and backspace behave smartly

" Word wrapping preferences
set nowrap              " Do not wrap lines
set nolinebreak         " When wrapping lines, break the 'dumb' way
set textwidth=0         " Disable line breaking
" set formatoptions=c,q,r,t

" Serach preferences
set incsearch           " Search incrementally
set hlsearch            " Highlight search
set ignorecase          " Ignore casing by default
set smartcase           " Use casing if i type uppercase
" nnomap <CR> :noh<CR><CR>

" Behavior settings
set more                " Show more promot on screen overflow
set autoread            " Reload buffers when file changed in filesystem
set hidden              " Do not force to write buffer when switching
set showtabline=2       " always show tabline
set noautowrite         " Do not write buffer unless instructed to
set lazyredraw          " Redraw only when needed
set history=1000        " Longer history
set undolevels=1000     " Longer undo buffer
set nobackup            " Do not generate backupfiles
set noswapfile          " Do not use a file as a buffer
set viminfo=%50,'50,/50,h,\"500,:50,n~/.viminfo
" % Remember this many buffers
" ' Remember marks for this many buffers
" / Remember this many searches
" h Do not highlight searches when loading
" " Remember, at most, macros this long
" : Remember this many ex commands
" n Use this file to store viminfo


" Interface settings
set mouse=a             " Enable mouse
set mousehide           " Hide mouse when typing
set shell=bash          " Use this shell as default

" Visual interface settings
"
" Coloring and theme related settings
colors blackboard        " Use this theme
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set termguicolors

" Patch to force tmux to show colors
" The "^[" is a single character. You enter it by pressing Ctrl+v and then ESC.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" Makes the background transparent. Leave these out if you're not using a transparent terminal.
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE

set cursorline          " Highlight current edditing line
set ruler               " Show the line number on the bar
set number              " Enable line numbers
set numberwidth=5       " Change line number column width
set showcmd             " Show the command beein typed on the bottom
set showmode            " Show which mode is vim currently on
set sidescrolloff=5     " Show this many lines to the sides of cursor
set scrolloff=5         " Show this many lines top and bottom of cursor
set wildmenu            " Command line has tab completion
set cmdheight=2         " The command line is this many lines height
set visualbell          " Replace errorbell with visual blink
set noerrorbells        " Dont make sound
set showmatch           " Briefley blink corresponding bracket
set list                " Show invisible characters
set listchars=eol:¬,tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+

" Cursor tipo bloque en terminal
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" Status line information
set laststatus=2        " Always show a status line

" Fold information and behavior
" set foldmethod=syntax
" set nofoldenable
set foldcolumn=2        " Width of fold column to the left


" Mappings
set ttimeout            " Timeout when typing mppings
set ttimeoutlen=100     " Length of mapping timeout
let mapleader=','
let maplocalleader='\\'

" Y behaves more naturally
map Y y$
" j and k move through visual lines (not actual lines)
nmap j gj
nmap k gk
" toggle highlight search
nmap <Leader>h :nohls<CR>
" toggle relative line numbering
nmap <Leader>n :setlocal relativenumber!<CR>
" Change next buffer
nmap <C-b> :b#<CR>
nmap <C-m> :bnext<CR>
nmap <C-n> :bprev<CR>
nmap <C-w> :bd<CR>

" Write a privileged file with :SudoW or :SudoWrite, it will prompt for sudo password when writing
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Abreviaturas

" Mapeos de movimientos


" Specific Filetype autocommands
" autocmd filetype python set expandtab


" Used plugins:

"       lightline
let g:lightline = {
    \ 'colorscheme': 'blackboard',
    \ }

"       Ctrl-P - Easier file opening with soft search feature

"       Syntastic - Integrated syntax checking (needs installed checkers)

"       tComment - Easy toggle comments
" let g:tcommentMaps=0    " Disable default mapings from tComment
" When toggling comments do it on column 0
noremap <Leader>cc :TComment col=0<CR>
" Append a comment at the end of line
noremap <Leader>cA o <Esc>:TComment<CR>kJA<Backspace>

"       NERD Tree - Integrated file explorer
noremap <Leader>nt :NERDTreeToggle<CR>

"       DelimitMate - Conviniently autoclose (),{},[],"", and ''

"       unimpaired - Some usefull keymaps for common operations


" Useful pugins
"       vim-operator-surround - Tool to surround things with enclosing pairs
"
"       LaTeX-Box
"       let g:LatexBox_latexmk_options = '-pvc -pdflatex="pdflatex -shell-escape"'
"       let g:LatexBox_viewer = 'open'
"
"       vim-easytags
"       tagbar

