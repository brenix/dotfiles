# z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  zle .accept-line
  cd "$(_z -l 2>&1 | fzf --nth 2.. +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

zle -N z
bindkey '^[g' z
