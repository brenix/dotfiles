# NVIM Setup

## Primary Features

- Intellisense and completion for many languages (coc.vim)
- Fuzzy file switching (fzf) with file proximity sorting (proximity-sort)
- Snippets (coc.vim, kubernetes, terraform)
- Statusline (lightline) and tabline (lightline-bufferline)
- Fast text searching (ripgrep)
- Start page (startify)
- Git integration (fugitive, coc.vim)
- Sane syntax highlighting and formatting for many languages (vim-poliglot)
- Live markdown previews (instant-markdown)
- Multiple cursor support (multiple-cursors)
- Tmux integration and more

## Prerequisites

The following packages should be installed by your local package manager

- `neovim`
- `ripgrep` (`rg` binary) - For fuzzy searching
- `proximity-sort` - For fuzzy searching
  - This requires a manual `cargo build` from the [source repo](https://github.com/jonhoo/proximity-sort)
  - Place in a bin directory that is in your `PATH`
- `instant-markdown-d` (optional) - For markdown previews
  - This requires a manual `npm install -g instant-markdown-d`
- `terraform-lsp` (optional) - For terraform autocompletion
- `docker-langserver` (optional) - For dockerfile autocompletion
- `bash-language-server` (optional) - For bash autocompletion

## Keybindings

### Leader keybindings

Most keybindings are centered around the "leader" key: `<spacebar>`

First, type the leader key (`<spacebar>`), then the following key to activate the function listed

| Keybinding   | Function                                            |
| ------------ | --------------------------------------------------- |
| `h`          | Clear search highlights                             |
| `x`          | Close current buffer                                |
| `X`          | Close current buffer without saving                 |
| `w`          | Write current file                                  |
| `W`          | Write current file and quit                         |
| `q`          | Quit                                                |
| `Q`          | Quit without saving                                 |
| `e`          | Edit a new file (relative to the current file path) |
| `s`          | Open a new buffer split horizontally                |
| `v`          | Open a new buffer split vertically                  |
| `r`          | Reload the nvim configuration                       |
| `p`          | Fuzzy file search (Highly recommended)              |
| `k`          | Fuzzy buffer search                                 |
| `l`          | Toggle line numbers                                 |
| `i`          | Toggle indent lines                                 |
| `<spacebar>` | Switch between two most recent buffers              |
| `g`          | Toggle git gutters                                  |
| `f`          | Find a string across files (ripgrep)                |
| `cu`         | Comment line                                        |
| `uc`         | Un-comment line                                     |
| `c<space>`   | Toggle comment                                      |
| `\|`         | Align markdown tables                               |

### Function keybindings

| Keybinding | Function                   |
| ---------- | -------------------------- |
| `F2`       | Toggle paste mode          |
| `F4`       | Toggle tagbar              |
| `F5`       | Remove trailing whitespace |

### Other keybindings

| Keybinding | Function                                              |
| ---------- | ----------------------------------------------------- |
| `Ctrl+P`   | Fuzzy project switcher (see dirs to search in config) |
| `Ctrl+N`   | Toggle multiple cursors                               |
