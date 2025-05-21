#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
BACKUP_DIR="$HOME/dotfiles_backup"

echo "Starting dotfiles symlinking process from: $SCRIPT_DIR"
echo "Targeting your home directory: $HOME"
read -p "Press any key to continue..." -n 1 -s
echo ""

find "$SCRIPT_DIR" -type f -name ".*" ! -name "." ! -name ".." -print0 | while IFS= read -r -d $'\0' file; do
    filename=$(basename "$file")
    target_link="$HOME/$filename"
    if [ -e "$target_link" ]; then
        if [ ! -L "$target_link" ] || [ "$(readlink "$target_link")" != "$file" ]; then
            echo "---"
            echo "WARNING: '$target_link' already exists and is not a symlink to this dotfile."
            echo "This may overwrite existing files/links in your home directory."
            mkdir -p "$BACKUP_DIR"
            echo "Backing up '$target_link' to '$BACKUP_DIR/'"
            mv "$target_link" "$BACKUP_DIR/$filename-$(date +%Y%m%d%H%M%S)"
            echo "Creating symlink: $file -> $target_link"
            ln -s "$file" "$target_link"
            echo "---"
        else
            echo "Skipping '$filename': '$target_link' is already a correct symlink."
        fi
    else
        echo "Creating symlink: $file -> $target_link"
        ln -s "$file" "$target_link"
    fi
done

echo ""
echo "Dotfiles symlinking process completed."
