" For neovim
let g:python_host_prog = '/home/felixlau/anaconda/bin/python'
" let g:python3_host_prog = '/home/felixlau/anaconda3/bin/python'
runtime! plugin/python_setup.vim

let mapleader = ","

set nocompatible
filetype off

" Sorry Uganda
set shortmess+=I

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

" Use jk for Esc
imap jk <Esc>

" color
let base16colorspace=256
set background=dark
colorscheme base16-tomorrow

" Copy to localhost:8378
nnoremap <leader>Y :call system('nc 0.0.0.0 8378', @0)<CR>
" Plugins =================================================================

" Nerdtree
nmap <tab> :NERDTreeToggle<cr>
autocmd VimEnter * set winfixwidth
let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
" map * <Plug>(asterisk-gz*)
" map # <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" FZF
if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
    let $FZF_DEFAULT_COMMAND='ag -g ""'
    let $SHELL='/bin/sh'
endif

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-b> :Buffers<CR>
nnoremap <silent> \ :Ag<space>
nnoremap <silent> <leader>. :Tags<CR>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" easybuffer
nmap <leader>b :EasyBufferToggle<cr>
noremap <leader>p :bprevious<cr>
noremap <leader>n :bnext<cr>

" easymotion
let g:sneak#streak = 1

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json']

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'base16'

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" vim-tags
let g:vim_tags_ctags_binary = '~/local/bin/ctags'
let g:vim_tags_ignore_files = ['.ctagsignore', '.gitignore', '.agignore']
let g:vim_tags_directories = []
let g:vim_tags_main_file = '.tags'
let g:vim_tags_auto_generate = 1

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'pylint']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E226'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=80'], }

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#documentation_command = "K"
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" vim-julia
let g:latex_to_unicode_suggestions = 0
let g:latex_to_unicode_eager = 0
let g:latex_to_unicode_auto = 0

" surround.vim
nmap <silent> dsf ds)db

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
" Use <BS> so it works on neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
let g:slime_paste_file = "$HOME/.slime_paste"

" Misc ====================================================================

" Be a real VIM user
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Disable mouse support on neovim
set mouse=c

" Move cursor by displayed line when wrapping
noremap <silent> k gk
noremap <silent> j gj

" Clear highlight
noremap <silent><Leader>/ :nohls<CR>

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
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
set secure
set dictionary=/usr/share/dict/words
set ignorecase
set smartcase
set list
set autowrite
set spell

" Center search
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Insert new line with enter without going to insert mode
nmap <leader><CR> :a<CR><CR>.<CR>

" Always show 5 lines below / above the cursor
set scrolloff=10

" Replace all occurences by default
set gdefault

" Use Q for formatting instead Ex
nnoremap <silent> Q gwip

" Use ag instead of grep
set grepprg=ag\ --nogroup\ --nocolor

" Use sh for vim-tmux-navigator for fast switch out
set shell=/bin/sh

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
set expandtab

" Map W to :w and Q to :q
nnoremap W :w<CR>
nnoremap Q :q<CR>

" Trim whitespace when saving
autocmd BufWritePre * %s/\s\+$//e
" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
