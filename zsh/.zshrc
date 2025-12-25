if [[ -o login && -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
  if uwsm check may-start; then
    exec uwsm start default
  fi
fi

# Environment Variables
export MANPAGER='less -R --use-color -Dd+r -Du+b'
export MANROFFOPT='-P -c'

export GOPATH="$HOME/.cache/go"
export GOBIN="$GOPATH/bin"
typeset -U path PATH
path=(
  ~/.bin
  $GOPATH/bin
  ~/.krew/bin
  ~/.local/bin
  $path
)

# Aliases
alias calc='qalc'
alias cat='bat'
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
alias kvs='kubectl-view_secret'
alias kvsec='kubectl-view_secret'
alias replace='ambr'
alias bat='bat --paging=never --style=plain --decorations=never'
alias diff='diff --color=auto'
alias fd='fd --hidden --no-ignore'
alias gaa='git add --all'
alias ga='git add'
alias gba='git branch --all'
alias gb='git branch'
alias gca='git commit --verbose --all'
alias gc='git commit --verbose'
alias gcl='git clone --recurse-submodules'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gd='git diff'
alias g='git'
alias gl='git pull --prune'
alias glo='git log --oneline --decorate --pretty=format:"%C(auto)%h %s (%Cgreen%an%C(auto))"'
alias gmt='go mod tidy'
alias 'gpf!'='git push --force'
alias gpf='git push --force-with-lease'
alias gp='git push'
alias gpv='git push --verbose'
alias grep='grep --color=auto'
alias grhh='git reset --hard HEAD'
alias grm='git rebase -i $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias gsh='git show --format=raw -m'
alias gst='git status'
alias ip='ip -color=auto'
alias kubectl='kubecolor'
alias ls='lsd --group-directories-first'
alias la='ls -Al'
alias l='ls -l'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias mv='mv -iv'
alias rm='rm -I'
alias remove='sudo pacman -Rnsc'
alias sw='git switch'
alias u='sudo pacman -Syu'
alias v='helix'
alias vi='helix'
alias vim='helix'
alias virsh='virsh -c qemu:///system'
alias vm='virsh start windows'
alias x='k9s'
alias zad='ls -d */ | xargs -I {} zoxide add {}'

# Initializations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(mise activate zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
autoload -Uz compinit && compinit

# Source local configs
for file in ~/.config/zsh/conf.local.d/*.zsh(N); do
  source "$file"
done
