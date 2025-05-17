# https://www.atlassian.com/git/tutorials/dotfiles
function cfg
    command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

# Prevent default completions for the `cfg` command. It will
# recurse into directories and basically hang forever.
complete -e -c cfg
complete -c cfg -f
