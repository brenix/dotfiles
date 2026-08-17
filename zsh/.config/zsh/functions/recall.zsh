# `!!` expands to the last command, `!$` to its last argument, as fish does.
_recall_last_command() {
  if [[ ${LBUFFER##*[[:space:]]} == '!' ]]; then
    LBUFFER="${LBUFFER%!}$(fc -ln -1 2>/dev/null)"
  else
    LBUFFER+='!'
  fi
}

_recall_last_argument() {
  local last
  if [[ ${LBUFFER##*[[:space:]]} == '!' ]]; then
    last=$(fc -ln -1 2>/dev/null)
    LBUFFER="${LBUFFER%!}${last##* }"
  else
    LBUFFER+='$'
  fi
}

zle -N _recall_last_command
zle -N _recall_last_argument
bindkey '!' _recall_last_command
bindkey '$' _recall_last_argument
