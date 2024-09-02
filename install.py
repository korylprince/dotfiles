#!/usr/bin/python3

import os
import sys

install_editor = (".config/nvim",)
install_shell = (".zshrc",)
install_sway = (
    ".config/environment.d",
    ".config/fontconfig",
    ".config/fuzzel",
    ".config/mako",
    ".config/sway",
    ".config/swaylock",
    ".config/swaynag",
    ".config/waybar",
)
install_yabai = (
    ".config/yabai",
    ".config/skhd",
)
install_nvimpager = (".config/nvim", ".cache/nvim", ".local/share/nvim")

HOME = os.path.expanduser("~")


def install_links(links):
    print("installing", ", ".join(links))

    modified = False
    for link in links:
        linkpath = os.path.join(HOME, link)
        dotpath = os.path.join(HOME, ".dotfiles", link)
        if os.path.exists(linkpath):
            if os.path.islink(linkpath):
                if os.path.abspath(os.readlink(linkpath)) != dotpath:
                    modified = True
                    print(f"Warning: {linkpath} is not symlinked to {dotpath}")
            else:
                modified = True
                print(f"Warning: {linkpath} exists")
        else:
            os.symlink(dotpath, linkpath)
            modified = True
            print(f"{linkpath} symlinked to {dotpath}")

    if not modified:
        print("links already installed")


def install_nvimpager_links():
    print("installing", ", ".join(install_nvimpager))
    modified = False
    for link in install_nvimpager:
        dotpath = os.path.join(HOME, link)
        linkpath = dotpath + "pager"
        if not os.path.exists(linkpath):
            modified = True
            os.symlink(dotpath, linkpath)
            print(f"{linkpath} symlinked to {dotpath}")

    if not modified:
        print("links already installed")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./install.py [editor, shell, sway, yabai]")
        sys.exit(1)

    links = (
        {
            "editor": install_editor,
            "shell": install_shell,
            "sway": install_sway,
            "yabai": install_yabai,
        }
    ).get(sys.argv[1], None)
    if links is None:
        print("Usage: ./install.py [editor, shell, sway, yabai]")
        sys.exit(1)

    if sys.argv[1] == "shell":
        install_nvimpager_links()

    install_links(links)
