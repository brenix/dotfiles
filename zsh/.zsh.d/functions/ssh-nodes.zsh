# ssh-nodes executes ssh-multi to a list of given nodes using kubectl args
ssh-nodes() {
  ssh-multi $(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' $@)
}
