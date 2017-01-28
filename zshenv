# use neovim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Auto-update zinit
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)

# Override system executables with local ones
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib:$LD_RUN_PATH

# Anaconda
export PATH=$HOME/anaconda/bin:$PATH

# CUDA
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export CUDA_DEVICE_ORDER=PCI_BUS_ID  # Match nvidia-smi device id with CUDA

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
[[ -d ~/.tmuxifier ]] && eval "$(~/.tmuxifier/bin/tmuxifier init -)"

# Caffe
export PATH=$PATH:$HOME/devel/caffe/build/tools
export PYTHONPATH=$PYTHONPATH:$HOME/devel/caffe/python
export PYTHONPATH=$PYTHONPATH:$HOME/devel/selective_search_ijcv_with_python

# Tensorflow
export TF_CPP_MIN_LOG_LEVEL=1

# NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "brew" ] && source $(brew --prefix nvm)/nvm.sh   # Source nvm on Mac

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'

# Utilities
export PATH=$PATH:$HOME/.bin

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
