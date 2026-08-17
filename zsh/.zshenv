# Environment for every zsh. Interactive config is in ~/.zshrc.

export MANPAGER='less -R --use-color -Dd+r -Du+b'
export MANROFFOPT='-P -c'

export GOPATH="$HOME/.cache/go"
export GOBIN="$GOPATH/bin"

path=(
  "$HOME/.local/bin"
  "$HOME/.krew/bin"
  "$GOBIN"
  "$HOME/.bin"
  "$HOME/.cargo/bin"
  $path
)
# Drop entries that do not exist on this host, then de-duplicate.
path=($^path(N-/))
typeset -U path PATH

# Non-interactive shells get mise's shims.
if [[ ! -o interactive ]] && (( $+commands[mise] )); then
  eval "$(mise activate zsh --shims)"
fi
