#!/bin/sh

ln -s ~/.dotfiles/.zprofile ~/.zprofile
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.xinitrc ~/.xinitrc
mkdir -p ~/.config
ln -s ~/.dotfiles/.config/awesome ~/.config/awesome
mkdir -p ~/.python
ln -s ~/.dotfiles/.python/funcs.sh ~/.python/funcs.sh
