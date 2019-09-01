# z
unalias z
z() {
  if [[ ! ${#${(z)BUFFER}} -eq 0 && -o auto_cd ]]; then
    zle .accept-line
  fi
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  if [[ ! ${#${(z)BUFFER}} -eq 0 && -o auto_cd ]]; then
    zle .accept-line
  fi
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

zle -N z
bindkey '^[g' z
