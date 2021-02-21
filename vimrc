" For neovim
runtime! plugin/python_setup.vim

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" Color
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

source ~/.vim/autocmd.vim
source ~/.vim/keymapping.vim
source ~/.vim/settings.vim

source ~/.vim/plugins/coc.vim
source ~/.vim/plugins/easybuffer.vim
source ~/.vim/plugins/fzf.vim
source ~/.vim/plugins/gitgutter.vim
source ~/.vim/plugins/goyo.vim
source ~/.vim/plugins/lightline.vim
source ~/.vim/plugins/nerdtree.vim
source ~/.vim/plugins/surround.vim
source ~/.vim/plugins/tagbar.vim
source ~/.vim/plugins/vim-asterisk.vim
source ~/.vim/plugins/vim-black.vim
source ~/.vim/plugins/vim-markdown.vim
source ~/.vim/plugins/vim-pydocstring.vim
source ~/.vim/plugins/vim-slime.vim
source ~/.vim/plugins/vim-tags.vim
source ~/.vim/plugins/vim-tmux-navigator.vim

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
