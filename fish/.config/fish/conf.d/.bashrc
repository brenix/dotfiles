# -- Interactive Check
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -- Aliases
alias ,='mise exec'
alias bat='bat --paging=never --style=plain --decorations=never'
alias bw='rbw'
alias calc='qalc'
alias cat='bat'
alias da='doas'
alias de='kanshictl switch dual'
alias diff='diff --color=auto'
alias ds='kanshictl switch vfio'
alias fd='fd --hidden --no-ignore'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcl='git clone --recurse-submodules'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull --prune'
alias glo="git log --oneline --decorate --pretty=format:'%C(auto)%h %s (%Cgreen%an%C(auto))'"
alias gmt='go mod tidy'
alias gp='git push'
alias gpf!='git push --force'
alias gpf='git push --force-with-lease'
alias gpv='git push --verbose'
alias grep='grep --color=auto'
alias grhh='git reset --hard HEAD'
alias grm='git rebase -i $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias gsh='git show --format=raw -m'
alias gst='git status'
alias ip='ip -color=auto'
alias k='kubectl'
alias kdd='kubectl describe deployment'
alias kdno='kubectl describe node'
alias kdp='kubectl describe pod'
alias kgcm='kubectl get configmap'
alias kgd='kubectl get deployment'
alias kgds='kubectl get daemonset'
alias kge='kubectl get events'
alias kgno='kubectl get node'
alias kgns='kubectl get namespace'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pod -A'
alias kgs='kubectl get service'
alias kgsa='kubectl get serviceaccount'
alias kgsec='kubectl get secret'
alias kgss='kubectl get statefulset'
alias kk='kubectl get pod'
alias kl='kubectl logs'
alias kubectl='kubecolor'
alias kvs='kubectl view-secret'
alias kvsec='kubectl view-secret'
alias l='ls -l'
alias la='ls -Al'
alias ls='eza --group-directories-first --git --no-user --no-time --no-filesize'
alias mkdir='mkdir -p'
alias monkeytype='bluekeys'
alias mr='mise run'
alias mv='mv -iv'
alias replace='ambr'
alias rm='rm -I'
alias sw='git switch'
alias usv='SVDIR=$HOME/.config/service sv'
alias v='hx'
alias vi='hx'
alias vim='hx'
alias virsh='virsh -c qemu:///system'
alias vm='virsh start windows'
alias wtl='wt select'
alias wtm='wt merge'
alias wtr='wt remove'
alias wts='wt switch'
alias x='k9s'
alias zad='ls -d */ | xargs -I {} zoxide add {}'

# -- Environment Variables
export GOPATH="$HOME/.cache/go"
export GOBIN="$GOPATH/bin"
export PATH="$HOME/.local/bin:$HOME/.krew/bin:$GOPATH/bin:$HOME/.bin:$PATH"
export MANPAGER='less -R --use-color -Dd+r -Du+b'
export MANROFFOPT='-P -c'

# -- Source additional configuration
if [ -d "$HOME/.config/bash/conf.local.d" ]; then
    for file in "$HOME/.config/bash/conf.local.d"/*.sh; do
        [ -r "$file" ] && . "$file"
    done
fi

# -- Tool Initializations
if command -v starship >/dev/null; then
    eval "$(starship init bash)"
fi

if command -v zoxide >/dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v mise >/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v fzf >/dev/null; then
    eval "$(fzf --bash)"
    export FZF_DEFAULT_OPTS="--ansi --color=bg:-1,bg+:-1,spinner:6,hl:7,fg:7,header:6,info:7,pointer:1,marker:0,prompt:2,hl+:2"
fi
