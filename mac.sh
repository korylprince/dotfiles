#!/usr/bin/env bash

mkdir -p ~/code/go

git config --global user.name "Kory Prince"
git config --global user.email "korylprince@gmail.com"

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

brew install zsh
brew install ctags
brew install vim --with-lua
brew install hg

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

/usr/local/bin/vim +BundleInstall +qall
/usr/local/bin/vim +GoInstallBinaries +qall

defaults write com.apple.Terminal "Startup Window Settings" Pro
defaults write com.apple.Terminal "Default Window Settings" Pro

chsh -s /bin/zsh
