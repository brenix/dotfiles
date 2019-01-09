.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ bash beets bspwm chrome git ncmpcpp openbox polybar ssh termite tmux vim x11 zsh


.PHONY: unstow
unstow:
	@stow -D -t ~ bash beets bspwm chrome git ncmpcpp openbox polybar ssh termite tmux vim x11 zsh
