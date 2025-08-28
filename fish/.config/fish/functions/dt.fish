function dt
    command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

# Prevent completions to avoid hangs
complete -e -c cfg
complete -c cfg -f
