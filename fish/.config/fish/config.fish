if status is-login; and test (tty) = /dev/tty1
    set -l distro (grep -Po '(?<=^ID=).*' /etc/os-release | string trim -c '"')
    switch $distro
        case arch
            # if type -q uwsm
            #     if uwsm check may-start
            #         exec uwsm start default
            #     end
            # else if type -q startx
            if type -q startx
                exec startx -- -keeptty
            end
        case cachyos void
            # Point to the existing bus managed by turnstile
            set -gx DBUS_SESSION_BUS_ADDRESS "unix:path=$XDG_RUNTIME_DIR/bus"

            if type -q mango
                exec mango
            end
    end
end

status is-interactive; and begin
    # -- Abbreviations
    abbr --add -- bw rbw
    abbr --add -- calc qalc
    abbr --add -- cat bat
    abbr --add -- ds 'kanshictl switch vfio'
    abbr --add -- de 'kanshictl switch dual'
    # abbr --add -- ds 'xrandr --output HDMI-A-0 --off'
    # abbr --add -- de 'xrandr --output HDMI-A-0 --auto --right-of DisplayPort-0; sleep 1; bspc desktop 3 -m HDMI-A-0; bspc desktop 4 -m HDMI-A-0'
    abbr --add -- k kubectl
    abbr --add -- kdd 'kubectl describe deployment'
    abbr --add -- kdno 'kubectl describe node'
    abbr --add -- kdp 'kubectl describe pod'
    abbr --add -- kgcm 'kubectl get configmap'
    abbr --add -- kgd 'kubectl get deployment'
    abbr --add -- kgds 'kubectl get daemonset'
    abbr --add -- kge 'kubectl get events'
    abbr --add -- kgno 'kubectl get node'
    abbr --add -- kgns 'kubectl get namespace'
    abbr --add -- kgp 'kubectl get pods'
    abbr --add -- kgpa 'kubectl get pod -A'
    abbr --add -- kgs 'kubectl get service'
    abbr --add -- kgsa 'kubectl get serviceaccount'
    abbr --add -- kgsec 'kubectl get secret'
    abbr --add -- kgss 'kubectl get statefulset'
    abbr --add -- kk 'kubectl get pod'
    abbr --add -- kl 'kubectl logs'
    abbr --add -- kvs kubectl view-secret
    abbr --add -- kvsec kubectl view-secret
    abbr --add -- mr 'mise run'
    abbr --add -- replace ambr
    abbr --add -- , 'mise exec'
    abbr --add -- monkeytype bluekeys

    # -- Aliases
    alias bat 'bat --paging=never --style=plain --decorations=never'
    alias diff 'diff --color=auto'
    alias fd 'fd --hidden --no-ignore'
    alias gaa 'git add --all'
    alias ga 'git add'
    alias gba 'git branch --all'
    alias gb 'git branch'
    alias gca 'git commit --verbose --all'
    alias gc 'git commit --verbose'
    alias gcl 'git clone --recurse-submodules'
    alias gco 'git checkout'
    alias gdc 'git diff --cached'
    alias gd 'git diff'
    alias g git
    alias gl 'git pull --prune'
    alias glo 'git log --oneline --decorate --pretty=format:'\''%C(auto)%h %s (%Cgreen%an%C(auto))'\'''
    alias gmt 'go mod tidy'
    alias gpf! 'git push --force'
    alias gpf 'git push --force-with-lease'
    alias gp 'git push'
    alias gpv 'git push --verbose'
    alias grep 'grep --color=auto'
    alias grhh 'git reset --hard HEAD'
    alias grm 'git rebase -i (git symbolic-ref refs/remotes/origin/HEAD | sed '\''s@^refs/remotes/origin/@@'\'')'
    alias gsh 'git show --format=raw -m'
    alias gst 'git status'
    alias ip 'ip -color=auto'
    alias kubectl kubecolor
    alias ls 'ls --color=never --group-directories-first'
    alias la 'ls -Al'
    alias l 'ls -l'
    alias mkdir 'mkdir -p'
    alias mv 'mv -iv'
    alias rm 'rm -I'
    alias sw 'git switch'
    alias usv 'SVDIR=$HOME/.config/service sv'
    alias wts 'wt switch'
    alias wtr 'wt remove'
    alias wtl 'wt select'
    alias wtm 'wt merge'
    alias v hx
    alias vi hx
    alias vim hx
    alias virsh 'virsh -c qemu:///system'
    alias vm 'virsh start windows'
    alias x k9s
    alias zad 'ls -d */ | xargs -I {} zoxide add {}'

    # -- CLI tools
    if type -q fzf
        fzf --fish | source
        set -gx FZF_DEFAULT_OPTS "--ansi --color=bg:-1,bg+:-1,spinner:6,hl:7,fg:7,header:6,info:7,pointer:1,marker:0,prompt:2,hl+:2"
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if type -q starship
        starship init fish | source
    end

    if type -q mise
        mise activate fish | source
    end

    # -- Environment
    set -gx GOPATH $HOME/.cache/go
    set -gx GOBIN $GOPATH/bin
    set -gx PATH $PATH $HOME/.local/bin $HOME/.krew/bin $GOPATH/bin $HOME/.bin
    set -xU MANPAGER 'less -R --use-color -Dd+r -Du+b'
    set -xU MANROFFOPT '-P -c'

    # -- Bindings
    bind \ce end-of-line

    # -- Colors
    set -gx fish_color_autosuggestion brblack
    set -gx fish_color_cancel -r
    set -gx fish_color_command green
    set -gx fish_color_comment magenta
    set -gx fish_color_cwd green
    set -gx fish_color_cwd_root red
    set -gx fish_color_end magenta
    set -gx fish_color_error red
    set -gx fish_color_escape cyan
    set -gx fish_color_history_current --bold
    set -gx fish_color_host normal
    set -gx fish_color_match --background=blue
    set -gx fish_color_normal normal
    set -gx fish_color_operator cyan
    set -gx fish_color_param blue
    set -gx fish_color_quote yellow
    set -gx fish_color_redirection yellow
    set -gx fish_color_search_match yellow '--background=black'
    set -gx fish_color_selection white --bold '--background=black'
    set -gx fish_color_status red
    set -gx fish_color_user green
    set -gx fish_color_valid_path --underline
    set -gx fish_pager_color_completion normal
    set -gx fish_pager_color_description yellow
    set -gx fish_pager_color_prefix white --bold --underline
    set -gx fish_pager_color_progress white '--background=cyan'

    # -- Source additional configuration
    for file in ~/.config/fish/conf.local.d/*.fish
        source $file
    end

    function fish_user_key_bindings
        bind ! bind_bang
        bind '$' bind_dollar
    end
end
