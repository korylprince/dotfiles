[[ -z $DISPLAY && $XDG_VTNR -eq 1 && -z "$TMUX" ]] && exec startx
