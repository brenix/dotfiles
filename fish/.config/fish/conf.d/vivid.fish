if status is-interactive && command -q vivid
    set -gx LS_COLORS (vivid generate $__fish_config_dir/vivid/ansi.yml)
end
