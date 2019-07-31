#!/bin/zsh

# -- options
# ignore recording duplicate commands
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
# ignore recording commands prefixed with a space
setopt hist_ignore_space
# allow reg-ex style matching
setopt extendedglob
# tab completion tweaks
setopt menucomplete
setopt noalwayslastprompt
# allow files to be clobbered
setopt clobber
# enable comments on the command line
setopt interactivecomments

# -- plugin framework

if [[ -f "${HOME}/.zplugin/bin/zplugin.zsh" ]]; then
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin
  source "${HOME}/.zplugin/bin/zplugin.zsh"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  source "${HOME}/.zplugin/bin/zplugin.zsh"
fi

# <- forget completions provided up to this moment
zplugin cdclear -q
setopt promptsubst

# oh-my-zsh
zplugin snippet OMZ::plugins/z/z.sh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/golang/golang.plugin.zsh
zplugin ice wait'1' silent
zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_work
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zplugin snippet OMZ::plugins/terraform/terraform.plugin.zsh

# syntax highlighting
zplugin light "zdharma/fast-syntax-highlighting"

# completions
zplugin light "zsh-users/zsh-completions"

# history
zplugin snippet PZT::modules/history/init.zsh
zplugin snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh"
zplugin snippet "https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh"

# fish-like style autocompletion
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=48
#export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_STRATEGY=history
zplugin ice wait'1' silent atload'_zsh_autosuggest_start'
zplugin light "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

# complete pairing brackets
zplugin light "hlissner/zsh-autopair"

# aws-vault integration
zplugin ice wait'1' silent
zplugin light "blimmer/zsh-aws-vault"

# git-ignore
zplugin ice pick'init.zsh' blockf
zplugin light "laggardkernel/git-ignore"
alias gi="git-ignore"

# tipz
zplugin ice wait'1' silent
zplugin light "molovo/tipz"

# cd-gitroot
zplugin light "mollifier/cd-gitroot"
alias cdu="cd-gitroot"

# -- prompt

# spaceship
zplugin light "denysdovhan/spaceship-prompt"

# overwrite dir function
spaceship_dir() {
  local pwd="${PWD/#$HOME/~}"
  if [[ "$pwd" == (#m)[/~] ]]; then
    SPACESHIP_DIR_PWD="$MATCH"
    unset MATCH
  else
    SPACESHIP_DIR_PWD="${${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}//\%/%%}/${${pwd:t}//\%/%%}"
  fi

  spaceship::section \
  "$SPACESHIP_DIR_COLOR" \
  "$SPACESHIP_DIR_PREFIX" \
  "$SPACESHIP_DIR_PWD" \
  "$SPACESHIP_DIR_SUFFIX"
}

# spaceship configuration
SPACESHIP_PROMPT_ORDER=(
  #user          # Username section
  #host          # Hostname section
  kubecontext   # Kubectl context section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # Python virtualenv section
  aws           # Amazon Web Services section
  terraform     # Terraform workspace section
  exit_code     # Exit code section
  char          # Prompt character
)

#SPACESHIP_RPROMPT_ORDER=(
#)

SPACESHIP_CHAR_SYMBOL="▶"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="blue"
SPACESHIP_USER_SHOW="true"
SPACESHIP_HOST_SHOW="true"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_COLOR="red"
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_DIR_COLOR="green"
SPACESHIP_GIT_PREFIX="("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_BRANCH_COLOR="cyan"
SPACESHIP_GIT_STATUS_COLOR="gray"
SPACESHIP_KUBECONTEXT_SYMBOL=""

# -- dircolors

autoload -U colors && colors
case "$OSTYPE" in
  "linux-gnu") eval $(dircolors -b ${HOME}/.dircolors) ;;
  "darwin*") eval $(/usr/local/opt/coreutils/libexec/gnubin/dircolors -b ${HOME}/dircolors) ;;
esac

# -- completion

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zstyle ":completion:*" rehash true
zstyle ":completion:*" completer _complete _correct _ignored _approximate
zstyle ":completion:::*:default" menu no select
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}"

# load bash autocompletion
autoload bashcompinit
bashcompinit

# autocomplete style, taken from gentoo
zstyle ":completion:*:warnings" format "%BSorry, no matches for: %d%b"
zstyle ":completion:*:commands" rehash 1

# -- key bindings
bindkey -v
bindkey "^A" beginning-of-line      # ctrl+a
bindkey "^E" end-of-line            # ctrl+e
bindkey "^F" vi-change-whole-line   # ctrl+f
bindkey "^[OF" end-of-line          # end key
bindkey "^[OH" beginning-of-line    # home key
bindkey "^[[2~" overwrite-mode      # insert key
bindkey "^[[3~" delete-char         # del key

# ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

# ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

# ctrl+backspace
bindkey '^H' backward-kill-word

# ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

# clear screen
bindkey "^[d" clear-screen

# -- external files
if [ -d ${HOME}/.zsh.d ]; then
  for file in ${HOME}/.zsh.d/*.zsh; do
    source $file
  done
  for file in ${HOME}/.zsh.d/local/*.zsh; do
    source $file
  done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
