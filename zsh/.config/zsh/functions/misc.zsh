u() {
  if (( $+commands[pacman] )); then
    sudo pacman -Syu
  elif (( $+commands[xbps-install] )); then
    sudo xbps-install -Su
  elif (( $+commands[pkg] )); then
    doas pkg update && doas pkg upgrade
  elif (( $+commands[apt] )); then
    sudo apt update
    sudo apt upgrade -y
  elif (( $+commands[dnf] )); then
    sudo dnf upgrade --refresh -y
  elif (( $+commands[zypper] )); then
    sudo zypper refresh
    sudo zypper update
  elif (( $+commands[brew] )); then
    brew update
    brew upgrade
  else
    return 1
  fi
}

remove() {
  if (( $+commands[pacman] )); then
    sudo pacman -Rnsc "$@"
  elif (( $+commands[xbps-remove] )); then
    sudo xbps-remove -R "$@"
  else
    return 1
  fi
}

pl() {
  local playlist
  playlist=$(mpc lsplaylists | fzf --reverse)
  if [[ -n $playlist ]]; then
    mpc clear
    mpc load "$playlist"
    mpc play
  fi
}

zz() {
  local tmp cwd
  tmp=$(mktemp -t "yazi-cwd.XXXXXX")
  yazi "$@" --cwd-file="$tmp"

  cwd=$(<"$tmp")
  [[ -n $cwd && $cwd != "$PWD" ]] && cd -- "$cwd"

  rm -f -- "$tmp"
}
