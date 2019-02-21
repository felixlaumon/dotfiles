# use neovim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Auto-update zinit
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local ${HOME}/.zshenv ${HOME}/.zshenv.local)

# Override system executables with local ones
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$HOME/local/lib:$LD_RUN_PATH

# Anaconda
. $HOME/anaconda/etc/profile.d/conda.sh
conda activate base

# CUDA
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/:/usr/local/cuda/extras/CUPTI/lib64/
export CUDA_DEVICE_ORDER=PCI_BUS_ID  # Match nvidia-smi device id with CUDA

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
[[ -d ~/.tmuxifier ]] && eval "$(~/.tmuxifier/bin/tmuxifier init -)"

# Tensorflow
export TF_CPP_MIN_LOG_LEVEL=1

# rbenv
# export PATH=$HOME/.rbenv/bin:$PATH
# eval "$(rbenv init -)"

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'

# Utilities
export PATH=$PATH:$HOME/.bin

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
