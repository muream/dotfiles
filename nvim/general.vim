" look & feel
colorscheme base16-onedark
set number                      " show line numbers
set relativenumber              " use relative line numbers
set cursorline                  " highlight current line
set showcmd                     " show command in botom bar
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching {[()]}

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" searching
set incsearch
set ignorecase                  " case insensitive
set smartcase                   " except if contains capital letter
set inccommand=nosplit

" tabs and spaces
set tabstop=4                   " number of visual spaces per tab
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces

" splits
set splitbelow                  " horizontal splits are created on the bottom
set splitright                  " vertical splits are created on the far right

" misc
set clipboard=unnamedplus       " use system clipboard
set noswapfile                  " don't create swapfiles
filetype indent on              " indent based on filetype (?)
set autoread                    " autoreload files

" buffers
set hidden                      " don't lose changes when switching buffers