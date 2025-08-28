function ktx
    set selected (find $HOME/.kube -maxdepth 1 \( -type f -o -type l -not -name '.*' \) -exec basename {} \; | fzf --height 40% --prompt "󱃾 " -0 -1)
    if not test -z $selected
        set -x -g KUBECONFIG "$HOME/.kube/$selected"
    end
end
