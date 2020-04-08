# install/source zinit

if [[ -f "${HOME}/.zinit/bin/zinit.zsh" ]]; then
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
  source "${HOME}/.zinit/bin/zinit.zsh"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
  source "${HOME}/.zinit/bin/zinit.zsh"
fi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# git library
zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh

# git plugin
zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

# git-open plugin
zinit ice wait lucid
zinit light "paulirish/git-open"

# golang
zinit ice wait lucid
zinit snippet OMZ::plugins/golang/golang.plugin.zsh

# gpg
zinit ice wait lucid
zinit snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh

# terraform
zinit ice wait lucid
zinit snippet OMZ::plugins/terraform/terraform.plugin.zsh

# z
zinit snippet OMZ::plugins/z/z.sh

# kubectl
zinit ice wait'1' silent
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

# ssh
identities=()
for f in $HOME/.ssh/*; do
  if [[ ${f##*/} == id_* && ${f##*/} != *.pub ]]; then
    identities+=${f##*/}
  fi
done
zstyle :omz:plugins:ssh-agent identities ${identities[@]}
zinit ice wait lucid
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

# syntax highlighting
# zinit ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# completions
zinit ice wait lucid
zinit light "zsh-users/zsh-completions"

# history
zinit ice wait lucid
zinit snippet PZT::modules/history/init.zsh

# fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice wait lucid
zinit snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh"

zinit ice wait lucid
zinit snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh"

# autosuggestions

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=48
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

zinit ice wait'1' silent atload'_zsh_autosuggest_start'
zinit light "zsh-users/zsh-autosuggestions"

# complete pairing brackets
zinit ice wait lucid
zinit light "hlissner/zsh-autopair"

# aws-vault integration
zinit ice wait silent
zinit light "blimmer/zsh-aws-vault"

# git-ignore
zinit ice wait lucid pick'init.zsh' blockf
zinit light "laggardkernel/git-ignore"

# tipz
zinit ice wait lucid
zinit light "molovo/tipz"

# cd-gitroot
zinit ice wait lucid
zinit light "mollifier/cd-gitroot"

# spaceship
zinit light "denysdovhan/spaceship-prompt"
