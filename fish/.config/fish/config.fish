# Automatically start X on TTY1
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end

status is-interactive; and begin
    # -- Abbreviations
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
    abbr --add -- kvs kubectl view-secret
    abbr --add -- kvsec kubectl view-secret
    abbr --add -- mr 'mise run'
    abbr --add -- replace ambr
    abbr --add -- , 'mise exec'

    # -- Aliases
    alias bat 'bat --paging=never --style=plain --decorations=never'
    alias diff 'diff --color=auto'
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
    alias grep 'grep --color=auto'
    alias grhh 'git reset --hard HEAD'
    alias grm 'git rebase -i (git symbolic-ref refs/remotes/origin/HEAD | sed '\''s@^refs/remotes/origin/@@'\'')'
    alias gsh 'git show --format=raw -m'
    alias gst 'git status'
    alias ip 'ip -color=auto'
    alias kubectl kubecolor
    alias ls 'lsd --group-directories-first'
    alias la 'ls -Al'
    alias l 'ls -l'
    alias mkdir 'mkdir -p'
    alias mv 'mv -iv'
    alias remove 'sudo pacman -Rnsc'
    alias rm 'rm -I'
    alias sw 'git switch'
    alias v helix
    alias vi helix
    alias vim helix
    alias virsh 'virsh -c qemu:///system'
    alias vm 'virsh start windows'
    alias x k9s
    alias zad 'ls -d */ | xargs -I {} zoxide add {}'

    # -- CLI tools
    if command -q fzf
        fzf --fish | source
        set -gx FZF_DEFAULT_OPTS "--ansi --color=bg:-1,bg+:-1,spinner:6,hl:7,fg:7,header:6,info:7,pointer:1,marker:0,prompt:2,hl+:2"
    end

    if command -q zoxide
        zoxide init fish | source
    end

    if command -q starship
        starship init fish | source
    end

    if command -q mise
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
    bind nul 'zi && commandline --function repaint'

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

    set -gx LS_COLORS 'no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:'
end
