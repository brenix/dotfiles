#
# These things are run when an Openbox X Session is started.
# You may place a similar script in $HOME/.config/openbox/autostart
# to run user-specific things.
polybar main -r &

$HOME/.fehbg
#xsetroot -solid "#3B4252"
#hashwall -f '#3b4252' -b '#2e3440' -s 12

# restore wal settings
#wal -R

# fun with hacker sounds
#buckle -p ~/.bucklespring &

# transparency
picom -b
