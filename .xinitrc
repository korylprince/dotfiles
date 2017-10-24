#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
/home/administrator/.screenlayout/main.sh &
/usr/bin/xscreensaver -no-splash &
nitrogen --restore &
exec gnome-session --session=awesome
