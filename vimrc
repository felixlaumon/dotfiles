let mapleader = ","

set nocompatible
filetype on
filetype off

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" General
filetype plugin indent on
syntax on

" Prevent delay
set notimeout
set ttimeout
set ttimeoutlen=10

" color
colorscheme molokai

" Nerdtree
nmap <tab> :NERDTreeToggle<cr>
set winfixwidth

" ag.vim
nnoremap <leader>a :Ag -i<space>
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0

" easybuffer
nmap <leader>be :EasyBufferToggle<cr>
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDCommenter
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>
let NERDSpaceDelims=1

" Yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '~/.vim/tmp'
nmap <leader>y :YRShow<cr>

" Be a real VIM user
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Show the 80th character
set textwidth=80
set colorcolumn=+1

" Line number
set number
set numberwidth=5

" Paste mode
set pastetoggle=<leader>p

" Show current line
set cursorline

augroup vimrcEx
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile Appraisals set filetype=ruby
    autocmd BufRead,BufNewFile *.md set filetype=markdown

    " Enable spellchecking for Markdown
    autocmd FileType markdown setlocal spell

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
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
set exrc
set secure
set dictionary=/usr/share/dict/words
set ignorecase
set smartcase
set list

" Auto reload vimrc
autocmd! BufWritePost vimrc source $MYVIMRC

" Invisiable character
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
set textwidth=80
set expandtab
set wrap

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
