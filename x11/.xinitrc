#!/bin/sh

# -- source additional xinitrc scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# DBUS Fix?
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# -- ensure that gtk themes are applied uniformly in the desktop environment
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# -- scale gtk elements and fonts
export GDK_SCALE=0.0
export GDK_DPI_SCALE=1.0

# -- set cursor
xsetroot -cursor_name left_ptr &

# -- load fonts
xset +fp /home/brenix/.local/share/fonts/bitmap
xset fp rehash
xset +dpms

# -- load xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# -- clipboard sync
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# -- enable numlock
numlockx &

# -- color calibration
xcalib -o 0 -b 0.9 -gc 1.05 $HOME/.colors/asus-vg248qe.icm
xcalib -o 1 -b 0.9 -gc 1.05 $HOME/.colors/asus-vg248qe.icm

# -- set wallpaper
~/.fehbg &

# -- barrier/synergy
pgrep barriers || barriers --enable-crypto &

# -- map capslock to escape
setxkbmap -option caps:escape

# -- window manager

#compton -bCG -o 0.45 -m 0.88 --no-fading-openclose --opacity-rule "90:class_g = 'Code'" --opacity-rule "90:class_g = 'Slack'"

# bspwm
#exec dbus-launch bspwm &>/tmp/bspwm.log

# openbox
exec dbus-launch openbox-session
