#!/bin/bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
eval "$(dbus-launch --sh-syntax)" &

# fast launch on GTK/Qt apps
fc-cache -f &
gtk-update-icon-cache -q &

# -- notifications
mako &

# -- bar
waybar &

# -- display profiles
kanshi &

# -- wallpaper
swww-daemon &

# -- clipboard
wl-paste --type text --watch cliphist store &

# -- idle
swayidle -w timeout 600 'wlopm --off *' resume 'wlopm --on *' &

# polkit (auth)
if ! pgrep -x "xfce-polkit" >/dev/null; then
  /usr/lib/xfce-polkit/xfce-polkit &
fi
