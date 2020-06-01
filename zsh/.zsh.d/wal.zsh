# Import colorscheme from 'wal'
[[ -f ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
[[ -f ~/.cache/wal/colors-tty.sh ]] && source ~/.cache/wal/colors-tty.sh
