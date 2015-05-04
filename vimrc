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
set background=dark
let base16colorspace=256
colorscheme base16-bright

" Nerdtree
nmap <tab> :NERDTreeToggle<cr>
set winfixwidth
let NERDTreeRespectWildIgnore = 1

" ctrl-p
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0
nnoremap <leader>. :CtrlPTag<cr>

" vim-ags
nnoremap <leader>a :Ags<space>
let g:ags_edit_show_line_numbers = 1

" easybuffer
nmap <leader>be :EasyBufferToggle<cr>
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" lightline
let g:bufferline_echo = 0
" https://github.com/timss/vimconf/blob/44c3b9202316a544e351aea30e6147b2ebfadb62/.vimrc#L382-L531
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \     'left': [
    \         ['mode', 'paste'],
    \         ['fugitive', 'readonly'],
    \         ['ctrlpmark', 'bufferline']
    \     ],
    \     'right': [
    \         ['lineinfo'],
    \         ['percent'],
    \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
    \     ]
    \ },
    \ 'component': {
    \     'paste': '%{&paste?"!":""}'
    \ },
    \ 'component_function': {
    \     'mode'         : 'MyMode',
    \     'fugitive'     : 'MyFugitive',
    \     'readonly'     : 'MyReadonly',
    \     'ctrlpmark'    : 'CtrlPMark',
    \     'bufferline'   : 'MyBufferline',
    \     'fileformat'   : 'MyFileformat',
    \     'fileencoding' : 'MyFileencoding',
    \     'filetype'     : 'MyFiletype'
    \ },
    \ 'component_expand': {
    \     'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \     'syntastic': 'middle',
    \ },
    \ 'subseparator': {
    \     'left': '|', 'right': '|'
    \ }
    \ }

let g:lightline.mode_map = {
    \ 'n'      : ' N ',
    \ 'i'      : ' I ',
    \ 'R'      : ' R ',
    \ 'v'      : ' V ',
    \ 'V'      : 'V-L',
    \ 'c'      : ' C ',
    \ "\<C-v>" : 'V-B',
    \ 's'      : ' S ',
    \ 'S'      : 'S-L',
    \ "\<C-s>" : 'S-B',
    \ '?'      : '      ' }

function! MyMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
            \ fname == 'ControlP' ? 'CtrlP' :
            \ winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyFugitive()
    try
        if expand('%:t') !~? 'Tagbar' && exists('*fugitive#head')
            let mark = '∓ '
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &readonly ? '⭤' : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
            \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

function! MyBufferline()
    call bufferline#refresh_status()
    let b = g:bufferline_status_info.before
    let c = g:bufferline_status_info.current
    let a = g:bufferline_status_info.after
    let alen = strlen(a)
    let blen = strlen(b)
    let clen = strlen(c)
    let w = winwidth(0) * 4 / 11
    if w < alen+blen+clen
        let whalf = (w - strlen(c)) / 2
        let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
        let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
        return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
    else
        return b . c . a
    endif
endfunction

function! MyFileformat()
    return winwidth('.') > 90 ? &fileformat : ''
endfunction

function! MyFileencoding()
    return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

let g:ctrlp_status_func = {
    \ 'main': 'CtrlPStatusFunc_1',
    \ 'prog': 'CtrlPStatusFunc_2',
    \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.perl,*py call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

" NERDCommenter
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>
let NERDSpaceDelims=1

" Yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" let g:yankring_history_dir = '~/.vim/tmp'
nmap <leader>y :YRShow<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pep8', 'flake8', 'pyflakes', 'pylint']
let g:syntastic_python_pep8_args='--ignore=E501'

" vim-jedi
let g:jedi#auto_vim_configuration = 0


" Be a real VIM user
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Clear highlight
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

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc,*.pyc,*.pickle,*.npy,*.zip,*.npy
set wildmenu

" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

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

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
