complete -cf sudo

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
