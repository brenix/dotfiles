# Interactive zsh. Environment lives in ~/.zshenv.

# -- Plugins
eval "$(sheldon source)"

# -- Prompt
(( $+commands[starship] )) && eval "$(starship init zsh)"

# -- History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS

# -- Colours
(( $+commands[vivid] )) && export LS_COLORS="$(vivid generate ~/.config/vivid/ansi.yml)"

export FZF_DEFAULT_OPTS="--ansi --color=bg:-1,bg+:-1,spinner:6,hl:7,fg:7,header:6,info:7,pointer:1,marker:0,prompt:2,hl+:2"

# -- Completions
# Anything generating completions must come after this.
autoload -Uz compinit
[[ -d ~/.cache/zsh ]] || mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'

# -- Aliases
alias bat='bat --paging=never --style=plain --decorations=never'
alias bw='rbw'
alias calc='qalc'
alias cat='bat'
alias de='kanshictl switch dual'
alias diff='diff --color=auto'
alias ds='kanshictl switch vfio'
alias fd='fd --hidden --no-ignore'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='EZA_COLORS="mp=1;34" eza --group-directories-first --git --color=auto'
alias la='ls -Al'
alias l='ls -l'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias mr='mise run'
alias mv='mv -iv'
alias replace='ambr'
alias rm='rm -I'
alias usv='SVDIR=$HOME/.config/service sv'
alias v='hx'
alias vi='hx'
alias vim='hx'
alias virsh='virsh -c qemu:///system'
alias vm='virsh start windows'
alias x='k9s'
alias zad='ls -d */ | xargs -I {} zoxide add {}'

# -- Aliases, git
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
alias glo='git log --oneline --decorate --pretty=format:"%C(auto)%h %s (%Cgreen%an%C(auto))"'
alias gmt='go mod tidy'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias 'gpf!'='git push --force'
alias gpv='git push --verbose'
alias grhh='git reset --hard HEAD'
alias grm='git rebase -i $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias gsh='git show --format=raw -m'
alias gst='git status'
alias sw='git switch'

# -- Aliases, worktrunk
alias wtl='wt list'
alias wtm='wt merge'
alias wtr='wt remove'
alias wts='wt switch'

# -- Aliases, kubernetes
alias k='kubectl'
alias kubectl='kubecolor'
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
alias kvs='kubectl view-secret'
alias kvsec='kubectl view-secret'

# -- Keybindings
bindkey -e
bindkey '^E' end-of-line

# zsh-history-substring-search is deferred, so queue the bindings behind it.
if (( $+functions[zsh-defer] )); then
  zsh-defer -c 'bindkey "^[[A" history-substring-search-up
                bindkey "^[[B" history-substring-search-down
                bindkey "^P" history-substring-search-up
                bindkey "^N" history-substring-search-down'
fi

# -- Functions and local config
# shell.local.d is shared with fish; conf.local.d is zsh only.
setopt NULL_GLOB
for file in ~/.config/zsh/functions/*.zsh \
            ~/.config/shell.local.d/*.sh \
            ~/.config/zsh/conf.local.d/*.zsh; do
  source "$file"
done
unsetopt NULL_GLOB
