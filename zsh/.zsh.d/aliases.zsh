alias ..='cd ..'
alias abs='asp'
alias cp='cp -i'
alias de='xrandr --output DVI-I-1 --mode 1920x1080 --rate 144 --left-of DVI-D-0'
# alias de='xrandr --output DVI-I-1 --mode 1920x1080 --rate 144 --left-of DVI-D-0 && bspc monitor DVI-I-1 -d 1 2 && bspc monitor DVI-D-0 -d 3 4'
alias ds='xrandr --output DVI-I-1 --off && polybar-launch'
alias k='kubectl'
alias l='ls -lhg'
alias la='ls -lah'
alias ls='ls --color=always --group-directories-first'
alias mkdir='mkdir -p -v'
alias mtr='sudo TERM=linux-m mtr'
alias poweroff='sudo systemctl poweroff'
alias re-source="source '$(print -P %N)'"
alias reboot='sudo systemctl reboot'
alias reddit='rtv'
alias remove='sudo pacman -Rscu'
alias s='sudo systemctl'
alias ssh='TERM=xterm-256color ssh'
alias svim='sudoedit'
alias t='todoist --color'
alias tmux='tmux attach || tmux new-session'
alias u='yay -Syu --editmenu'
alias virsh='/usr/bin/virsh -c qemu:///system'
alias vm='virsh start win10 && sudo systemctl start synergy'
alias x='startx'
alias xrefresh='xrdb load ~/.Xresources && xrdb -merge ~/.Xresources'
alias yay='yay --editmenu'
if [ -x $(which nvim) ]; then alias vim='nvim'; fi
