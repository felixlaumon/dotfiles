# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export TERM="xterm-256color"

# I hate emails
unset MAILCHECK

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_ir-black

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward

bindkey "[D" backward-word
bindkey "[C" forward-word

# z
 . ~/tools/z/z.sh

# load zgen
source "${HOME}/tools/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-autosuggestions
    # Prevent delay when pasting text
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
    ZSH_AUTOSUGGEST_USE_ASYNC=1

    zgen load zsh-users/zsh-completions src

    # Theme
    zgen oh-my-zsh themes/frisk

    # save all to init script
    zgen save
fi

# Prevent exiting shell by ctrl-d
set -o ignoreeof

# gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
