#!/bin/zsh

source $HOME/.zsh.d/path.zsh
source $HOME/.zsh.d/options.zsh
source $HOME/.zsh.d/plugins.zsh
source $HOME/.zsh.d/prompt.zsh
source $HOME/.zsh.d/completion.zsh
source $HOME/.zsh.d/keybindings.zsh
source $HOME/.zsh.d/aliases.zsh
source $HOME/.zsh.d/dircolors.zsh
source $HOME/.zsh.d/direnv.zsh
source $HOME/.zsh.d/wal.zsh

if [ -d ${HOME}/.zsh.d ]; then
  for f in $(find ${HOME}/.zsh.d/functions -type f -name '*.zsh'); do
    source $f
  done
  for f in $(find ${HOME}/.zsh.d/local -type f -name '*.zsh'); do
    source $f
  done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
