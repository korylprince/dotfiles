# korylprince's dotfiles

These are the configuration files I use for my Arch Linux installations.

[packages.txt](https://github.com/korylprince/dotfiles/blob/master/packages.txt) contains all of the Arch packages required.

## Installation

Clone this repo to `~/.dotfiles`:

```
$ git clone https://github.com/korylprince/dotfiles.git ~/.dotfiles
```

[install.py](https://github.com/korylprince/dotfiles/blob/master/) will install symlinks different sets of dot files.

```
$ cd ~/.dotfiles
$ ./install.py -h
Usage: ./install.py [editor, shell, sway, all]
```

## Sway Desktop Environment

I use sway because it's a modern, composable tiling window manager that's easy to configure and style.

| Package | Purpose |
| ------- | ------- |
| gdm | login manager |
| sway | wayland tiling window manager | 
| swaybg | wallpaper manager |
| swayidle & swaylock | idle/suspend/lock manager |
| waybar | top bar (sway workspace management, task bar, indicators) |
| network-manager-applet | network management |
| swaynag | menus |
| fuzzel | application launcher |
| mako | notifications |
| grim & slurp | screenshots |
| gnome-terminal | terminal emulator |

## Solarized Theme

I prefer the [Solarized](https://ethanschoonover.com/solarized/) Dark palette, and most of the UI components above are styled using the palette.

For GTK apps, I've installed the [adw-gtk3](https://github.com/lassekongo83/adw-gtk3) theme with the [solarized-dark style from adw-colors](https://github.com/lassekongo83/adw-colors/tree/main/themes/solarized-dark).

## $SHELL

I use zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

## Development

I develop using neovim with a few plugins, namely [coc.nvim](https://github.com/neoclide/coc.nvim) for language server integrations. Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
