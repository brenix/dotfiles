[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec bspwm 2>/tmp/bspwm.err
