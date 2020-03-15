# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export TERM="xterm-256color"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward

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
    zgen oh-my-zsh plugins/kubectl

    export NVM_LAZY_LOAD=true
    zgen load lukechilds/zsh-nvm
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-autosuggestions
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

# Speed up pasting with auto-suggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-389324292
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}
pastefinish() {
    zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME/anaconda/bin/conda shell.zsh hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<