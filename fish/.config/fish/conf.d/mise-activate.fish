# Single canonical mise activation point.
# Shadows any vendor-installed mise-activate.fish (e.g. from package manager),
# preventing duplicate activations. Interactive-only to keep non-interactive
# fish shells (scripts, popup commands) fast.
if status is-interactive && command -q mise
    mise activate fish | source
end
