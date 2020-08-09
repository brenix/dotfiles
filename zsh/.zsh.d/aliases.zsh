alias ..='cd ..'
alias abs='asp'
alias ave='aws-vault exec'
alias cdu="cd-gitroot"
alias cp='cp -i'
alias gi="git-ignore"
alias grep='grep --color=auto'
alias k='kubectl'
alias l='ls -lhg'
alias la='ls -lah'
alias ls='ls --color=always --group-directories-first'
alias mkdir='mkdir -p -v'
alias mtr='sudo TERM=linux-m mtr'
alias p='pueue'
alias pad='pueue add'
alias pc='pueue clean'
alias pf='pueue follow'
alias pl='pueue log'
alias poweroff='sudo systemctl poweroff'
alias pst='pueue status'
alias reboot='sudo systemctl reboot'
alias reload='. ~/.zshrc'
alias remove='sudo pacman -Rscu'
alias s='sudo systemctl'
alias sv='sudoedit'
alias svim='sudoedit'
alias sw='git switch'
alias t='terraform'
alias ta='terraform apply'
alias taa='terraform apply -auto-approve'
alias tf='terraform format'
alias ti='terraform init --backend=false'
alias tii='terraform init'
alias tim='terraform import'
alias tmux='tmux -2'
alias to='terraform output'
alias tp='terraform plan'
alias ts='terraform show'
alias tst='terraform state'
alias tu='terraform 0.12upgrade -yes'
alias tv='terraform validate'
alias tw='terraform workspace'
alias uu='topgrade'
alias v='nvim'
alias vim='nvim'
alias virsh='/usr/bin/virsh -c qemu:///system'
alias vm='virsh start win10'
alias vv='nvim ~/.dotfiles/nvim/.config/nvim/init.vim'
alias x='startx'
alias xrefresh='xrdb load ~/.Xresources && xrdb -merge ~/.Xresources'
[[ "$OSTYPE" == "darwin"*  ]] && alias u='brew update && brew upgrade && brew cleanup && brew cask upgrade'
[[ "$OSTYPE" == "linux-gnu" ]] && alias u='yay -Syu'
(( $+commands[bat] )) && alias cat='bat' && alias less='bat'
