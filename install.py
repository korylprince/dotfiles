#!/usr/bin/python3

import os
import sys

install_editor = (".config/nvim", )
install_shell = (".zshrc", ".config/nvimpager")
install_sway = (".config/environment.d", ".config/fontconfig", ".config/fuzzel", ".config/mako", ".config/sway", ".config/swaylock", ".config/swaynag", ".config/waybar",)

install_all = install_editor + install_shell + install_sway

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

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./install.py [editor, shell, sway, all]")
        sys.exit(1)

    links = ({
        "editor": install_editor,
        "shell": install_shell,
        "sway": install_sway,
        "all": install_all,
    }).get(sys.argv[1], None)
    if links is None:
        print("Usage: ./install.py [editor, shell, sway, all]")
        sys.exit(1)

    install_links(links)
