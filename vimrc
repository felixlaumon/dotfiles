" For neovim
runtime! plugin/python_setup.vim

let mapleader = ","

set nocompatible
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

" Color
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Use jk for Esc
imap jk <Esc>

" Copy to localhost:8378
nnoremap <leader>Y :call system('nc -w 1 0.0.0.0 8378', @0)<CR>

" Plugins =================================================================

" Nerdtree
nmap <leader>n :NERDTreeToggle<cr>
autocmd VimEnter * set winfixwidth
let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-asterisk
let g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" FZF
if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
    let $FZF_DEFAULT_COMMAND='ag -g ""'
    let $SHELL='/bin/sh'
endif

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-b> :Buffers<CR>
nnoremap <silent> \ :Ag<space>
nnoremap <silent> <leader>. :Tags<CR>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

nnoremap <silent> <Leader>a :Ag <C-R><C-W><CR>

" easybuffer
nmap <leader>b :EasyBufferToggle<cr>
noremap <leader>[ :bprevious<cr>
noremap <leader>] :bnext<cr>
noremap <leader>w :bdelete<cr>

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json']

" vim-pydocstring
let g:pydocstring_formatter = 'numpy'
let g:pydocstring_enable_mapping = 0
nmap <silent> <leader>s <Plug>(pydocstring)

" vim-black
nmap <leader>k :Black<CR>

" yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" js
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" vim-tags
let g:vim_tags_ctags_binary = '~/local/bin/ctags'
let g:vim_tags_ignore_files = ['.ctagsignore', '.gitignore', '.agignore']
let g:vim_tags_directories = []
let g:vim_tags_main_file = '.tags'
let g:vim_tags_auto_generate = 1

if use_lsp
    " vim-lsp
    let g:lsp_diagnostics_enabled = 0  " use ale instead
    let g:lsp_highlight_references_enabled = 1
    let g:lsp_virtual_text_enabled = 0
    let g:lsp_preview_float = 1
    nmap <leader>d :LspDefinition<cr>
    nmap <leader>r :LspRename<cr>
    nmap K :LspHover<cr>
else
    " coc
    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <leader>d <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    nnoremap <expr><C-d> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-d>"
    nnoremap <expr><C-u> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-u>"
endif

" surround.vim
nmap <silent> dsf ds)db

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
" Use <BS> so it works on neovim
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" vim-slime
if !empty($TMUX)
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
    let g:slime_paste_file = "$HOME/.slime_paste"
endif

" lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
set showtabline=2
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.active = {'left': [['mode', 'paste'], ['cocstatus', 'currentfunction', 'readonly', 'filename', 'modified']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline.component_function = {'cocstatus': 'coc#status', 'currentfunction': 'CocCurrentFunction'}
let g:lightline#bufferline#shorten_path = 0

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

    " Support // as comment in JSON
    autocmd FileType json syntax match Comment +\/\/.\+$+
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

" Spellcheck
set spell
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi SpellBad cterm=underline

" Center search
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Insert new line with enter without going to insert mode
nmap <leader><CR> :a<CR><CR>.<CR>

" Always show 10 lines below / above the cursor
set scrolloff=10

" Replace all occurrences by default
set gdefault

" Use Q for formatting instead Ex
nnoremap <silent> Q gwip

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

" Map W to :w and Q to :q
nnoremap W :w<CR>
nnoremap Q :q<CR>

" Trim whitespace when saving
autocmd BufWritePre * %s/\s\+$//e
" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
