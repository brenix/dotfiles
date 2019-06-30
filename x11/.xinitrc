#!/bin/sh

# -- source additional xinitrc scripts
#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# DBUS Fix?
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# -- ensure that gtk themes are applied uniformly in the desktop environment
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# -- scale gtk elements and fonts
export GDK_SCALE=0.0
export GDK_DPI_SCALE=1.0

# -- set keyboard/mouse speed
xset r rate 200 75
xset m 2/1 0

# -- set cursor
xsetroot -cursor_name left_ptr &

# -- load fonts
xset +fp /usr/share/fonts/misc
xset +fp /usr/share/fonts/local
xset +fp /home/brenix/.fonts/ttf
xset +fp /home/brenix/.fonts/bitmap
xset fp rehash
xset +dpms

# -- load xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# -- clipboard sync
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# -- enable numlock
numlockx &

# -- load xmodmap
/usr/bin/xmodmap $HOME/.Xmodmap

# -- load xbindkeys
#xbindkeys

# -- color calibration
xcalib -o 0 -co 100 -b 1 $HOME/.colors/asus-vg248qe.icm
xcalib -o 1 -co 100 -b 1 $HOME/.colors/asus-vg248qe.icm
#redshift -l 45.63873, -122.66149 &

# -- start urxvt daemon
urxvtd --quiet --opendisplay --fork

# -- set wallpaper
nitrogen --restore &

# -- window manager

compton -bCG -o 0.45 -m 0.88 --no-fading-openclose --opacity-rule "90:class_g = 'Code'"

# bspwm
exec dbus-launch bspwm &>/tmp/bspwm.log

# openbox
#exec dbus-launch openbox-session
