function gwa
    set -l repo (basename (git rev-parse --show-toplevel))
    if not set -q argv[1]
        set -l branch (git branch --show-current)
        set -l primary (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
        set -l name (echo $branch | string replace -a '/' '-')
        git switch $primary
        git worktree add ../$repo-$name $branch
        zoxide add ../$repo-$name
        cd ../$repo-$name
    else
        set -l branch $argv[1]
        set -l name (echo $branch | string replace -a '/' '-')
        git worktree add -b $branch ../$repo-$name
        zoxide add ../$repo-$name
        cd ../$repo-$name
    end
end
