# load completion
autoload -Uz compinit && compinit -u -d ${HOME}/.zcompdump-$ZSH_VERSION
zplugin cdreplay -q

# allow completion of sudo commands
zstyle ':completion::complete:*' gain-privileges 1

# automatically 'rehash' completion for new executables added in the $PATH
zstyle ':completion:*' rehash true

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# activate color-completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# enable completion options
zstyle ":completion:*" completer _expand _complete _ignored _approximate
zstyle ":completion:*" insert-unambiguous true

# bash-like completion
# zstyle ":completion:::*:default" menu no select

# completion cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# load bash completion support
autoload -Uz bashcompinit
bashcompinit

# complete aliases
compdef _kubectl k=kubectl
compdef _systemctl s=systemctl
compdef _terraform t=terraform
