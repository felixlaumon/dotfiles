let mapleader = ","

" Use jk for Esc
imap jk <Esc>

" Copy to localhost:8378
nnoremap <leader>Y :call system('nc -w 1 0.0.0.0 8378', @0)<CR>

" Move cursor by displayed line when wrapping
noremap <silent> k gk
noremap <silent> j gj

" Clear highlight
noremap <silent><Leader>/ :nohls<CR>

" Be a real VIM user
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Resize split
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Center search
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Insert new line with enter without going to insert mode
nmap <leader><CR> :a<CR><CR>.<CR>

" Use Q for formatting instead Ex
nnoremap <silent> Q gwip

" Map W to :w and Q to :q
nnoremap W :w<CR>
nnoremap Q :q<CR>
