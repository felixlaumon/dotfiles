# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export TERM="xterm-256color"

BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load tarruda/zsh-autosuggestions

    # theme
    zgen oh-my-zsh themes/ys

    # save all to init script
    zgen save
fi

# Enable auto suggest
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# Prevent exiting shell by ctrl-d
set -o ignoreeof

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
