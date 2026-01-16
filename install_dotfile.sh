#!/bin/bash

# ==========================================
# Shynneri Dotfiles Installer
# ==========================================

# 1. Get the absolute path of the dotfiles directory
#    (Assumes this script is run from inside ~/dev/.dotfile)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 2. Ask user about backups once at the start
echo "------------------------------------------------"
echo "Starting Dotfiles Installation..."
echo "Source: $DOTFILES_DIR"
echo "------------------------------------------------"
read -p "Do you want to backup existing files before installing? (y/n): " DO_BACKUP

# Function to create symlinks
link_file() {
    local src="$1"
    local dest="$2"
    local name="$3"

    # Check if the source exists in your dotfiles
    if [ ! -e "$src" ]; then
        echo "⚠️  Skipping $name: Source file not found at $src"
        return
    fi

    # Ensure the parent directory of the destination exists (e.g., ~/.config)
    mkdir -p "$(dirname "$dest")"

    # Check if a file/folder already exists at the destination
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [[ "$DO_BACKUP" == "y" || "$DO_BACKUP" == "Y" ]]; then
            # BACKUP MODE: Rename old file to .backup
            echo "📦 Backing up existing $name to ${dest}.backup"
            rm -rf "${dest}.backup" # Clear old backup if it exists
            mv "$dest" "${dest}.backup"
        else
            # NO BACKUP MODE: Delete existing file
            echo "🗑️  Deleting existing $name (No backup selected)"
            rm -rf "$dest"
        fi
    fi

    # Create the symbolic link
    echo "🔗 Linking $name..."
    ln -s "$src" "$dest"
}

# ==========================================
# Configuration Targets
# ==========================================

# Neovim
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim" "Neovim"

# Kitty Terminal
link_file "$DOTFILES_DIR/kitty" "$HOME/.config/kitty" "Kitty"

# Bashrc
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc" ".bashrc"

echo "------------------------------------------------"
echo "✅ Installation Complete!"
echo "------------------------------------------------"
