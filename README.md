dotfiles
<https://github.com/korylprince/dotfiles>

This is my repo of useful dot files mainly for vim and zsh for use in programming. Note: I'm running Arch so python3 is the default python.

#Initial Setup#

Run `git submodule init` and `git submodule update` to pull in the required submodules.

Run `makelns.sh` to create all the links. It won't overwrite your files, but make sure you read it first to see what it's doing!

#Vim Setup#

Install a newer (7.3+) vim and [vundle](https://github.com/gmarik/vundle). Run `:BundleInstall` to install all the vim plugins. Some of the plugins will require external programs.

#zsh Setup#

Install zsh and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), then have fun.

Optionally, `mkdir ~/.python` and run `virtualenv2 2` and `virtualenv 3` to enable `venv2` and `venv3` functions.

#Other Setup#

Theres also files for awesomewm, and `.xinitrc`, so be careful!

#Copyright Information#

License is Public Domain where available.
