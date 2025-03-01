function ssh-nodes
    set -l hosts (string split " " (kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' "$argv"))
    ssh-multi $hosts
end
