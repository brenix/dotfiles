typeset -U path
path=(
  ~/bin
  ~/go/bin
  ~/.local/bin
  /usr/local/opt/ruby/bin
  /usr/local/bin
  /usr/local/sbin
  ~/.krew/bin
  $path[@]
)

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:${PATH}
fi
