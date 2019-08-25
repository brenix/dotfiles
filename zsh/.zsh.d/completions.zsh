compdef _systemctl s=systemctl
compdef _kubectl k=kubectl
compdef _terraform t=terraform
if [[ $(which infractl) ]]; then
  source <(infractl completion zsh)
  compdef _infractl infractl i=infractl
fi
