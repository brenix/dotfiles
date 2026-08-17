cdr() {
  local root
  root=$(git rev-parse --show-toplevel) || return 1
  builtin cd "$root"
}
