# Dotfiles

Personal shell, git, and vim configuration.

## Setup

Run:

```sh
./install
```

This script backs up any existing files to `~/.dotfiles-backup/<timestamp>` and then creates symlinks to this repo.

## Submodules

After cloning, run:

```sh
git submodule update --init --recursive
```

## Local overrides (not tracked)

Create any of these files in your home directory if you need machine-specific settings:

- `~/.gitconfig.local`
- `~/.zshrc.local`
- `~/.bashrc.local`
- `~/.aliases.local`

Examples are available in this repo:

- `gitconfig.local.example`
- `zshrc.local.example`
- `bashrc.local.example`
- `aliases.local.example`
