# install/source zplugin

if [[ -f "${HOME}/.zplugin/bin/zplugin.zsh" ]]; then
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin
  source "${HOME}/.zplugin/bin/zplugin.zsh"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  source "${HOME}/.zplugin/bin/zplugin.zsh"
fi

# git library
zplugin ice wait lucid
zplugin snippet OMZ::lib/git.zsh

# git plugin
zplugin ice wait lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

# golang
zplugin ice wait lucid
zplugin snippet OMZ::plugins/golang/golang.plugin.zsh

# gpg
zplugin ice wait lucid
zplugin snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh

# terraform
zplugin ice wait lucid
zplugin snippet OMZ::plugins/terraform/terraform.plugin.zsh

# z
zplugin snippet OMZ::plugins/z/z.sh

# kubectl
zplugin ice wait'1' silent
zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

# ssh
zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_work
zplugin ice wait lucid
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

# syntax highlighting
zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# completions
zplugin ice wait lucid
zplugin light "zsh-users/zsh-completions"

# history
zplugin ice wait lucid
zplugin snippet PZT::modules/history/init.zsh

# fzf
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

zplugin ice wait lucid
zplugin snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh"

zplugin ice wait lucid
zplugin snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh"

# autosuggestions

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=48
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

zplugin ice wait'1' silent atload'_zsh_autosuggest_start'
zplugin light "zsh-users/zsh-autosuggestions"

# complete pairing brackets
zplugin ice wait lucid
zplugin light "hlissner/zsh-autopair"

# aws-vault integration
zplugin ice wait silent
zplugin light "blimmer/zsh-aws-vault"

# git-ignore
zplugin ice wait lucid pick'init.zsh' blockf
zplugin light "laggardkernel/git-ignore"

# tipz
zplugin ice wait lucid
zplugin light "molovo/tipz"

# cd-gitroot
zplugin ice wait lucid
zplugin light "mollifier/cd-gitroot"

# spaceship
zplugin light "denysdovhan/spaceship-prompt"
