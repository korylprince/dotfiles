#!/usr/bin/env bash

file_list=( ".zprofile" ".zshrc" ".tmux.conf" ".xinitrc" ".config/awesome" ".config/nvim" ".config/nitrogen" ".config/fontconfig/fonts.conf" ".python/funcs.sh" ".Xresources" ".dir_colors/dircolors" )

SUCCESS=true

for f in ${file_list[@]}
do
    mkdir -p `dirname $HOME/$f`;
    if [ ! -h $HOME/$f ];
        then if [ -a $HOME/$f ];
            then echo "WARNING: $HOME/$f already exists and is not a symlink"; 
                SUCCESS=false;
            else ln -s $HOME/.dotfiles/$f $HOME/$f;
                echo "$HOME/$f symlinked to $HOME/.dotfiles/$f";
        fi
        else if [ ! $(readlink -f $HOME/$f) == "$HOME/.dotfiles/$f" ];
            then echo "WARNING: $HOME/$f is already a symlink, but it points to $(readlink -f $HOME/$f)";
                SUCCESS=false;
        fi
    fi
done
if $SUCCESS;
    then echo "SUCCESS: All files symlinked correctly!";
    else echo "ERROR: Some files were not symlinked!";
fi
