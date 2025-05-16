# https://www.atlassian.com/git/tutorials/dotfiles
function d
    command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

# Prevent default completions for the `dot` command. It will
# recurse into directories and basically hang forever.
complete -e -c d
complete -c d -f
