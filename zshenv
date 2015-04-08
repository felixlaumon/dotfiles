# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

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

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
