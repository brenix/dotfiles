# --- findd: find directories in current path
findd() {
  find . -type d -name "*$1*"
}

# --- replace: find and replace text in current path
replace() {
  rg -l "$1" | xargs sed -i "s/$1/$2/g"
}

# --- z (override)
unalias z
z() {
  zle .accept-line
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  zle .accept-line
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

zle -N z
bindkey '^[g' z

edit() {
  local cmd="find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"
  setopt localoptions pipefail 2>/dev/null
  local selected="$(eval "$cmd" | fzf --reverse)"
  if [[ -z $selected ]]; then
    zle redisplay
    return 0
  fi
  nvim "$selected"
}
zle -N edit
bindkey '^[f' edit
