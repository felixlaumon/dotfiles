set nocompatible
filetype off

" General
filetype plugin indent on
syntax on

" Prevent delay
set notimeout
set ttimeout
set ttimeoutlen=10

" Disable mouse support on neovim
set mouse=c

" Show the 80th character
set textwidth=80
set colorcolumn=80

" Line number
set number
set numberwidth=4

" Show current line
set cursorline

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc,*.pyc,*.pickle,*.npy,*.zip,*.npy
set wildmenu

set splitbelow
set splitright

" Other settings
set encoding=utf-8
set history=1000
set incsearch
set laststatus=2
set ruler
set backspace=2
set showmatch
set hlsearch
set autoread
set binary
set secure
set dictionary=/usr/share/dict/words
set ignorecase
set smartcase
set list
set autowrite

" Spellcheck
set spell
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi SpellBad cterm=underline

" Always show 10 lines below / above the cursor
set scrolloff=10

" Replace all occurrences by default
set gdefault

" Use ag instead of grep
set grepprg=ag\ --nogroup\ --nocolor

" Use sh for vim-tmux-navigator for fast switch out
set shell=/bin/sh

" Invisible character
set listchars=tab:»·,trail:·,nbsp:·

if has('persistent_undo')
    " undo files
    set undodir=~/.vim/tmp/undo/
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
" backups
set backupdir=~/.vim/tmp/backup/
" swap files
set directory=~/.vim/tmp/swap/
set backup
set noswapfile

" Tab spaces
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
