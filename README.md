# dotfiles

My configuration files for mostly Linux (Archlinux) and OSX.

Current linux setup:

- **Window manager**: bspwm
- **Bar**: polybar
- **Terminal**: [st](https://github.com/brenix/st)
- **Colorsheme**: [Iceberg](https://cocopon.github.io/iceberg.vim/)
- **Shell**: zsh, tmux
- **Launcher**: rofi
- **Editor**: nvim
- **Music Player**: spotify, mpd, ncmcpp
- **Browser**: firefox-nightly

## Usage

The dotfiles are managed through [GNU stow](https://www.gnu.org/software/stow/)

Install the `stow` package using your local package manager:

```sh
# Archlinux
sudo pacman -Syy stow

# OSX
brew install stow
```

Then, from within the repo you can symlink any one of the directories (stow packages):

```sh
stow -v nvim # symlink nvim configuration
stow -v zsh  # symlink zsh configuration
```

> Note: Some directories simply contain configuration and are not meant to be
> symlinked.

To remove symlinks for a package:

```sh
stow -D nvim
```
