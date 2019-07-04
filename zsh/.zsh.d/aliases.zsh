alias ..='cd ..'
alias abs='asp'
alias cp='cp -i'
alias ctr='sudo ctr -n k8s.io'
#alias de='xrandr --output DVI-I-1 --mode 1920x1080 --rate 144 --left-of DVI-D-0 && bspc desktop 1 -m DVI-I-1 && bspc desktop 2 -m DVI-I-1 && bspc desktop Desktop -r'
#alias ds='xrandr --output DVI-I-1 --off && bspc monitor -o 1 2 3 4 DVI-D-0'
alias de='xrandr --output DVI-I-1 --mode 1920x1080 --rate 144 --left-of DVI-D-0'
alias ds='xrandr --output DVI-I-1 --off'
alias gp='sudo openconnect --protocol=gp $GP_HOST'
alias k='kubectl'
alias l='ls -lhg'
alias la='ls -lah'
alias ls='ls --color=always --group-directories-first'
alias mkdir='mkdir -p -v'
alias mtr='sudo TERM=linux-m mtr'
alias podman='sudo podman'
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
if [[ "$OSTYPE" == "darwin"*  ]]; then alias u='brew update && brew upgrade && brew cleanup'; fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then alias u='yay -Syu --editmenu'; fi
alias virsh='/usr/bin/virsh -c qemu:///system'
alias vm='virsh start win10 && sudo systemctl start synergy'
alias x='startx'
alias xrefresh='xrdb load ~/.Xresources && xrdb -merge ~/.Xresources'
alias yay='yay --editmenu'
