if status is-interactive && command -q vivid
    set -gx LS_COLORS (vivid generate ~/.config/vivid/ansi.yml)
end
