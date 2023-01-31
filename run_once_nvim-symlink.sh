#!/bin/sh
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -sf ~/.vim $XDG_CONFIG_HOME/nvim
ln -sf ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim