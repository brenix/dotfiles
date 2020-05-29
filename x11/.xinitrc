#!/bin/sh

# -- source additional xinitrc scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# -- ensure that gtk themes are applied uniformly in the desktop environment
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# -- set cursor
xsetroot -cursor_name left_ptr &

# -- load fonts
xset +fp /home/brenix/.local/share/fonts/bitmap
xset fp rehash
xset +dpms

# -- load xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# -- enable numlock
numlockx &

# -- color calibration
xcalib -o 0 -b 0 -gc 0.8 $HOME/.colors/asus-vg248qe.icm
xcalib -o 1 -b 0 -gc 0.8 $HOME/.colors/asus-vg248qe.icm

# -- barrier/synergy
pgrep barriers || barriers &

# -- map capslock to escape
setxkbmap -option caps:escape

# load nvidia settings
nvidia-settings -a InitialPixmapPlacement=2 \
  -a GlyphCache=1 \
  -a OpenGLImageSettings=3 \
  -a GpuPowerMizerMode=1

# -- window manager
#exec openbox-session
exec bspwm
