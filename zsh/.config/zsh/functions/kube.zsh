kns() {
  local context selected

  if [[ -n $1 ]]; then
    kubectl config set-context "$(kubectl config current-context)" --namespace "$1"
    return 0
  fi

  context=$(kubectl config current-context)
  selected=$(kubectl get namespaces -o name | cut -d / -f2 | fzf --height 40% --prompt "󱃾 " -0 -1)
  [[ -n $selected ]] && kubectl config set-context "$context" "--namespace=$selected"
}

ktx() {
  local selected
  selected=$(find "$HOME/.kube" -maxdepth 1 \( -type f -o -type l -not -name '.*' \) -exec basename {} \; \
    | fzf --height 40% --prompt "󱃾 " -0 -1)
  [[ -n $selected ]] && export KUBECONFIG="$HOME/.kube/$selected"
}

sc() {
  local context namespace selected

  if [[ -n $1 ]]; then
    if [[ $1 == */* ]]; then
      context=${1%%/*}
      namespace=${${1#*/}%%/*}
      kubectl config use-context "$context"
      kubectl config set-context "$context" --namespace="$namespace"
      return 0
    fi

    if [[ $1 == *-* ]]; then
      context=${1%%-*}
      namespace=${${1#*-}%%-*}
      kubectl config use-context "$context"
      kubectl config set-context "$context" --namespace="$namespace"
      return 0
    fi

    kubectl config use-context "$1"
    return 0
  fi

  selected=$(kubectl config get-contexts -o name | fzf --height 40% --prompt "󱃾 " -0 -1)
  [[ -n $selected ]] && kubectl config use-context "$selected"
}
