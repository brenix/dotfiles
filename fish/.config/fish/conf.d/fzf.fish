if status is-interactive && command -q fzf
    fzf --fish | source
    set -gx FZF_DEFAULT_OPTS "--ansi --color=bg:-1,bg+:-1,spinner:6,hl:7,fg:7,header:6,info:7,pointer:1,marker:0,prompt:2,hl+:2"
end
