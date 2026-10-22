if status is-interactive && command -q fzf
    fzf --fish | source
    set -gx FZF_DEFAULT_OPTS "--ansi --color=bg:-1,bg+:-1,fg:-1,hl:4,info:8,spinner:6,header:6,pointer:1,marker:5,prompt:2,hl+:2"
end
