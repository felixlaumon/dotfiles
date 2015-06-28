let mapleader = ","

set nocompatible
filetype on
filetype off

" For neovim
let g:python_host_prog = '~/anaconda/bin/python'

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
let base16colorspace=256
set background=dark
colorscheme base16-solarized

" " Nerdtree
" nmap <tab> :NERDTreeToggle<cr>
" set winfixwidth
" let NERDTreeRespectWildIgnore = 1

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ctrl-p
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_mruf_case_sensitive = 0
nnoremap <leader>. :CtrlPTag<cr>

" easybuffer
nmap <leader>be :EasyBufferToggle<cr>
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:vim_tags_ctags_binary = '~/local/bin/ctags'
let g:vim_tags_ignore_files = ['.ctagsignore', '.gitignore', '.agignore']
let g:vim_tags_directories = []
let g:vim_tags_main_file = '.tags'

" Yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" TODO why cannot save to the dir?
" let g:yankring_history_dir = '~/.vim/tmp'
nmap <leader>y :YRShow<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E241'

" vim-jedi
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#documentation_command = "K"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = ""
" Prevent the docstring window from popping up
autocmd FileType python setlocal completeopt-=preview

" Be a real VIM user
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
" Move cursor by displayed line when wrapping
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" Clear highlight
noremap <silent><Leader>/ :nohls<CR>

" Show the 80th character
set textwidth=80
set colorcolumn=+1

" Line number
set number
set numberwidth=5

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

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text call pencil#init()
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

" Use ag instead of grep
set grepprg=ag\ --nogroup\ --nocolor

" Define Ag to use ag
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

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

" Make use of Xterm bracked paste mode
" https://github.com/wincent/wincent/blob/3b0b2950cdcb09d23c87f0167c207d8c837cb1b2/.vim/plugin/term.vim#L93-114
" http://www.xfree86.org/current/ctlseqs.html#Bracketed%20Paste%20Mode
" http://stackoverflow.com/questions/5585129
function! s:BeginXTermPaste(ret)
    set paste
    return a:ret
endfunction
" enable bracketed paste mode on entering Vim
let &t_ti .= "\e[?2004h"
" disable bracketed paste mode on leaving Vim
let &t_te = "\e[?2004l" . &t_te
set pastetoggle=<Esc>[201~
inoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("")
nnoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("i")
vnoremap <expr> <Esc>[200~ <SID>BeginXTermPaste("c")
cnoremap <Esc>[200~ <nop>
cnoremap <Esc>[201~ <nop>

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
