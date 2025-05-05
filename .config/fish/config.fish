status is-interactive; and begin
    # Abbreviations
    abbr --add -- bw rbw
    abbr --add -- calc qalc
    abbr --add -- cat bat
    abbr --add -- curl curlie
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
    abbr --add -- kvs kubectl-view-secret
    abbr --add -- kvsec kubectl-view-secret
    abbr --add -- replace ambr

    # Aliases
    alias bat 'bat --paging=never --style=plain --decorations=never'
    alias dot 'git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    alias e 'helix .'
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
    alias grhh 'git reset --hard HEAD'
    alias grm 'git rebase -i (git symbolic-ref refs/remotes/origin/HEAD | sed '\''s@^refs/remotes/origin/@@'\'')'
    alias gsh 'git show --format=raw -m'
    alias gst 'git status'
    alias kubectl kubecolor
    alias la 'ls -Al'
    alias l 'ls -l'
    alias mkdir 'mkdir -p'
    alias mv 'mv -iv'
    alias rm 'rm -I'
    alias r 'sudo pacman -Rnsc'
    alias sw 'git switch'
    alias u 'sudo pacman -Syu'
    alias v helix
    alias vi helix
    alias vim helix
    alias virsh 'virsh -c qemu:///system'
    alias vm 'virsh start windows'
    alias x k9s
    alias zad 'ls -d */ | xargs -I {} zoxide add {}'

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source

    set -gx PATH $PATH $HOME/.local/bin $HOME/.krew/bin $GOPATH/bin
    set -gx GOPATH $HOME/.cache/go
    complete -c ssh-multi -w ssh
    bind \ce end-of-line
    bind ! bind_bang
    bind '$' bind_dollar
    bind -k nul 'zi && commandline --function repaint'
    set -gx fish_color_autosuggestion brblack
    set -gx fish_color_cancel -r
    set -gx fish_color_command brgreen
    set -gx fish_color_comment brmagenta
    set -gx fish_color_cwd green
    set -gx fish_color_cwd_root red
    set -gx fish_color_end brmagenta
    set -gx fish_color_error brred
    set -gx fish_color_escape brcyan
    set -gx fish_color_history_current --bold
    set -gx fish_color_host normal
    set -gx fish_color_match --background=brblue
    set -gx fish_color_normal normal
    set -gx fish_color_operator cyan
    set -gx fish_color_param brblue
    set -gx fish_color_quote yellow
    set -gx fish_color_redirection bryellow
    set -gx fish_color_search_match bryellow '--background=brblack'
    set -gx fish_color_selection white --bold '--background=brblack'
    set -gx fish_color_status red
    set -gx fish_color_user brgreen
    set -gx fish_color_valid_path --underline
    set -gx fish_pager_color_completion normal
    set -gx fish_pager_color_description yellow
    set -gx fish_pager_color_prefix white --bold --underline
    set -gx fish_pager_color_progress brwhite '--background=cyan'

    for file in ~/.config/fish/conf.local.d/*.fish
        source $file
    end
end
