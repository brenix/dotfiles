# dotfiles

## Installation

Install GNU Stow symlinking package manager.

    # Archlinux
    sudo pacman -Syy stow
    # Fedora/RHEL
    sudo dnf install -y stow
    # Debian
    sudo apt-get install stow

## Usage

Clone the dotfiles Stow directory:

    git clone git@github.com:brenix/dotfiles.git ~/.dotfiles

Install stow packages.

    cd ~/.dotfiles
    make stow

## Stow Basics

Install one or more stow packages into the parent target directory:

    cd ~/.dotfiles
    stow -v PACKAGE          # install a package
    stow -S PACKAGE PACKAGE  # install multiple packages

Useful options and commands:

    -d  # specify a custom Stow directory, default is cwd
    -t  # specify a custom target directory, default is parent of cwd
    stow -D PACKAGE  # delete the package from the target directory
    stow -R PACKAGE  # unstow and restow to prune old symlinks
    stow --simulate -v PACKAGE # show what actions would be performed
