# switch-namespace
sn() {
  local context
  local namespace
  local selected
  if [[ ! -z $1 ]]; then
    kubectl config set-context $(kubectl config current-context) --namespace "$1"
    return 0
  fi
  if [[ ! -x "$(which fzf 2>/dev/null)" ]]; then
    echo "please install fzf: github.com/junegunn/fzf" >&2
    return 1
  fi
  context=$(kubectl config current-context)
  selected=$(kubectl get namespaces -o name | cut -d / -f2 | fzf -0 -1 --reverse)
  if [[ ! -z "$selected" ]]; then
    kubectl config set-context "$context" "--namespace=$selected"
  fi
}

# switch-context
sc() {
  local context
  local selected
  if [[ ! -z $1 ]]; then
    if [[ $1 = *"/"* ]]; then
      context=$(echo $1 | cut -d / -f1)
      namespace=$(echo $1 | cut -d / -f2)
      kubectl config use-context $context
      kubectl config set-context $context --namespace=$namespace
      return 0
    fi
    if [[ $1 = *"-"* ]]; then
      context=$(echo $1 | cut -d - -f1)
      namespace=$(echo $1 | cut -d - -f2)
      kubectl config use-context $context
      kubectl config set-context $context --namespace=$namespace
      return 0
    fi
    kubectl config use-context "$1"
    return 0
  fi
  if [[ ! -x "$(which fzf 2>/dev/null)" ]]; then
    echo "please install fzf: github.com/junegunn/fzf" >&2
    return 1
  fi
  selected=$(kubectl config get-contexts -o name | fzf -0 -1 --reverse)
  if [[ ! -z "$selected" ]]; then
    kubectl config use-context "$selected"
  fi
}

# switch-kubeconfig
sk() {
  local kubeconfig
  local selected
  if [[ ! -x "$(which fzf 2>/dev/null)" ]]; then
    echo "please install fzf: github.com/junegunn/fzf" >&2
    return 1
  fi

  selected=$(find ${HOME}/.kube -maxdepth 1 -type f -exec basename {} \; | fzf -0 -1 --reverse)
  if [[ ! -z "$selected" ]]; then
    export KUBECONFIG="${HOME}/.kube/$selected"
  fi
}
