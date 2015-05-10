# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Override system executables with local ones
export PATH=$HOME/local/bin:$PATH

# Anaconda
export PATH=$HOME/anaconda/bin:$PATH

# For vim to recognize packages in Anaconda
export PYTHONPATH=$PYTHONPATH:$HOME/anaconda/lib/python2.7/site-packages

# CUDA
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

# cuDNN v2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/tools/cudnn-6.5-linux-x64-v2
export LIBRARY_PATH=$LIBRARY_PATH:~/tools/cudnn-6.5-linux-x64-v2
export CPATH=$CPATH:~/tools/cudnn-6.5-linux-x64-v2

# cuDNN v1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/tools/cudnn-6.5-linux-R1
export LIBRARY_PATH=$LIBRARY_PATH:~/tools/cudnn-6.5-linux-R1
export CPATH=$CPATH:~/tools/cudnn-6.5-linux-x64-R1

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

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
