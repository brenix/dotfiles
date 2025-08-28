function kns
    set context
    set namespace
    set selected
    if not test -z $argv[1]
        kubectl config set-context (kubectl config current-context) --namespace $argv[1]
        return 0
    end
    set context (kubectl config current-context)
    set selected (kubectl get namespaces -o name | cut -d / -f2 | fzf --height 40% --prompt "󱃾 " -0 -1)
    if not test -z $selected
        kubectl config set-context $context "--namespace=$selected"
    end
end
