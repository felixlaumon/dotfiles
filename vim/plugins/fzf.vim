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
