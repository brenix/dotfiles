function sc
    set context
    set selected
    if not test -z $argv[1]
        if echo $argv[1] | grep -q /
            set context (echo $argv[1] | cut -d / -f1)
            set namespace (echo $argv[1] | cut -d / -f2)
            kubectl config use-context $context
            kubectl config set-context $context --namespace=$namespace
            return 0
        end
        if echo $argv[1] | grep -q '\-'
            set context (echo $argv[1] | cut -d - -f1)
            set namespace (echo $argv[1] | cut -d - -f2)
            kubectl config use-context $context
            kubectl config set-context $context --namespace=$namespace
            return 0
        end
        kubectl config use-context $argv[1]
        return 0
    end
    set selected (kubectl config get-contexts -o name | fzf --height 40% --prompt "󱃾 " -0 -1)
    if not test -z $selected
        kubectl config use-context $selected
    end
end
