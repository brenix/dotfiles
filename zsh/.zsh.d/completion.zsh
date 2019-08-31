# load completion
autoload -Uz compinit
for dump in ${HOME}/.cache/zsh/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# configure completion
zstyle ":completion:*" cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}"
zstyle ":completion:*" completer _complete _correct _ignored _approximate
zstyle ":completion:*" rehash true
zstyle ":completion:*" use-cache on
zstyle ":completion:*:commands" rehash 1
zstyle ":completion:*:warnings" format "%BSorry, no matches for: %d%b"
zstyle ":completion:::*:default" menu no select

# load bash completion support
autoload bashcompinit
bashcompinit

# complete aliases
compdef _infractl i=infractl
compdef _kubectl k=kubectl
compdef _systemctl s=systemctl
compdef _terraform t=terraform
