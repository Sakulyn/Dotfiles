# Dotfiles
My dotfiles :-)

A clean, fast, and modular Zsh + Oh My Zsh setup for developers.

## Repository Structure 

```text
.
├── .aliases               # Custom command aliases (productivity shortcuts)
├── .gitconfig             # Global Git config (with handy aliases & speed tweaks)
├── .gitignore_global      # Global Git ignore rules
├── .tmux.conf             # Tmux terminal multiplexer configuration
├── .vimrc                 # Vim editor basic configuration
├── .zshrc                 # Main Zsh config (OMZ plugins, NVM, and Conda lazy load)
├── symlink-dotfiles.sh    # Script to automatically symlink these dotfiles to ~
└── README.md
```

## Quick Start 

```zsh
git clone https://github.com/Sakulyn/Dotfiles ~/Dotfiles
cd ~/Dotfiles 
chmod +x symlink-dotfiles.sh
./symlink-dotfiles.sh
```
