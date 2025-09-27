function ssh-multi
    set -l hosts
    if test -t 0
        set hosts $argv
    else
        while read -l line
            set --append hosts (string split " " $line)
        end
    end

    set -l target ssh-multi

    if test -n "$TMUX"
        tmux new-window -n "$target" "ssh $hosts[1]"
        for host in $hosts[2..-1]
            tmux split-window -t :"$target" -v "ssh $host"
            tmux select-layout -t :"$target" even-vertical >/dev/null
        end
        tmux select-pane -t 0
        tmux set-window-option synchronize-panes on
    else if test -n "$ZELLIJ"
        set -l layout_file (mktemp)
        printf 'layout {%s}' (string join "" (for host in $hosts; printf 'pane {command "ssh"; args "%s"; close_on_exit true;}; ' $host; end)) >$layout_file
        zellij action new-tab -l $layout_file -n ssh-multi
        zellij action toggle-active-sync-tab
        rm -f $layout_file
    else
        echo 'Neither tmux or zellij are running!'
    end
end

complete -c ssh-multi -w ssh
