# if $(command -v vivid >/dev/null); then
#   if [ -f ${HOME}/.config/vivid/themes/faded.yml ]; then
#     export LS_COLORS=$(vivid generate faded)
#   fi
# fi

if [ -f ${HOME}/.dircolors ]; then
  eval $(dircolors -b $HOME/.dircolors)
fi
