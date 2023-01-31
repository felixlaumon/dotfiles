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
" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
set showtabline=2
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.active = {'left': [['mode', 'paste'], ['cocstatus', 'currentfunction', 'readonly', 'filename', 'modified']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline.component_function = {'cocstatus': 'coc#status', 'currentfunction': 'CocCurrentFunction', 'filename': 'LightlineFilename'}
let g:lightline#bufferline#shorten_path = 0
