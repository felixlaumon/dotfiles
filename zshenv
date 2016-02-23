# use neovim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Override system executables with local ones
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib:$LD_RUN_PATH

# Anaconda
export PATH=$HOME/anaconda/bin:$PATH

# For vim to recognize packages in Anaconda
export PYTHONPATH=$PYTHONPATH:$HOME/anaconda/lib/python2.7/site-packages

# CUDA
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
[[ -d ~/.tmuxifier ]] && eval "$(~/.tmuxifier/bin/tmuxifier init -)"

# Caffe
export PATH=$PATH:$HOME/devel/caffe/build/tools
export PYTHONPATH=$PYTHONPATH:$HOME/devel/caffe/python
export PYTHONPATH=$PYTHONPATH:$HOME/devel/selective_search_ijcv_with_python

# NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "brew" ] && source $(brew --prefix nvm)/nvm.sh   # Source nvm on Mac

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
