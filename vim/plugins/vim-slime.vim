" vim-slime
if !empty($TMUX)
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
    let g:slime_paste_file = "$HOME/.slime_paste"
endif

" <leader>c to send the whole 'cell' delineated by # ---
nmap <leader>c ?# ---<CR> v/# ---<CR> :SlimeSend<CR>
