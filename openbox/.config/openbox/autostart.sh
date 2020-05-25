#
# These things are run when an Openbox X Session is started.
# You may place a similar script in $HOME/.config/openbox/autostart
# to run user-specific things.

# -- bar
polybar main -r &

# -- compositor
# picom -b

# -- notifcation daemon
dunst &

# -- urxvtd
# urxvtd -q -o -f

# -- wallpaper
$HOME/.fehbg
#hsetroot -solid "#3B4252"
#hashwall -f '#3b4252' -b '#2e3440' -s 12
