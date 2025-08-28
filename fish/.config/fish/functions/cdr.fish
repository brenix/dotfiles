function cdr
    set -l root_path (git rev-parse --show-toplevel)
    builtin cd $root_path
end
