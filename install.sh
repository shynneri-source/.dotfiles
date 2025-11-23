#!/usr/bin/env bash

# Dotfiles installer script for Ubuntu
# This script links the dotfiles from this repository to their correct locations in the home directory.

set -e  # Exit immediately if a command exits with a non-zero status

# Check if running in dry-run mode
if [[ "$1" == "--dry-run" ]] || [[ "$1" == "-n" ]]; then
    DRY_RUN=true
    echo "Running in dry-run mode. No changes will be made to your system."
else
    DRY_RUN=false
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    printf "${BLUE}[INFO]${NC} $1\n"
}

print_success() {
    printf "${GREEN}[SUCCESS]${NC} $1\n"
}

print_warn() {
    printf "${YELLOW}[WARNING]${NC} $1\n"
}

print_error() {
    printf "${RED}[ERROR]${NC} $1\n"
}

# Variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to copy directory or file
copy_config() {
    local src="$1"
    local dest="$2"

    # Check if destination already exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        print_warn "File/directory exists: $dest. Removing existing file/directory."
        if [ "$DRY_RUN" = false ]; then
            rm -rf "$dest"
        else
            print_info "[DRY RUN] Would remove: $dest"
        fi
    fi

    # Create parent directory if it doesn't exist
    local parent_dir=$(dirname "$dest")
    if [ ! -d "$parent_dir" ]; then
        if [ "$DRY_RUN" = false ]; then
            mkdir -p "$parent_dir"
        fi
        print_info "Created directory: $parent_dir"
    fi

    # Copy the file/directory
    if [ "$DRY_RUN" = false ]; then
        if [ -d "$src" ]; then
            cp -r "$src" "$dest"
        else
            cp "$src" "$dest"
        fi
    fi
    print_success "Copied: $src -> $dest"
}

# Function to install packages via apt (for Ubuntu)
install_packages() {
    print_info "Checking for required packages..."

    # List of packages to check for
    local packages=("git" "nvim" "tmux" "zsh" "kitty" "helix")
    local missing_packages=()

    for package in "${packages[@]}"; do
        if ! command -v "$package" &> /dev/null; then
            missing_packages+=("$package")
        fi
    done

    if [ ${#missing_packages[@]} -gt 0 ]; then
        print_warn "The following packages are not installed: ${missing_packages[*]}"
        if [ "$DRY_RUN" = false ]; then
            read -p "Would you like to install them? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo apt update
                sudo apt install -y "${missing_packages[@]}"
            else
                print_info "Continuing without installing packages. You may need to install them manually."
            fi
        else
            print_info "[DRY RUN] Would install packages: ${missing_packages[*]}"
        fi
    else
        print_success "All required packages are already installed."
    fi
}


# Function to install tmux config
install_tmux_conf() {
    if [ -f "$SCRIPT_DIR/.tmux.conf" ]; then
        copy_config "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
    else
        print_warn ".tmux.conf not found in source directory"
    fi
}

# Function to install zsh config
install_zshrc() {
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        copy_config "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    else
        print_warn ".zshrc not found in source directory"
    fi
}

# Function to install nvim config
install_nvim() {
    if [ -d "$SCRIPT_DIR/nvim" ]; then
        copy_config "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
    else
        print_warn "nvim config directory not found in source directory"
    fi
}

# Function to install kitty config
install_kitty() {
    if [ -d "$SCRIPT_DIR/kitty" ]; then
        if [ "$DRY_RUN" = false ]; then
            # Create a temporary directory to prepare the correct structure
            local temp_kitty_dir=$(mktemp -d)

            # Copy contents of kitty directory while excluding the nested kitty directory and backup files
            for item in "$SCRIPT_DIR/kitty/"*; do
                item_name=$(basename "$item")
                # Skip nested kitty directory and backup files
                if [[ "$item_name" != "kitty" && "$item_name" != "kitty.conf.bak" ]]; then
                    cp -r "$item" "$temp_kitty_dir/"
                fi
            done

            # Copy the prepared directory structure
            if [ -n "$(ls -A "$temp_kitty_dir")" ]; then
                copy_config "$temp_kitty_dir" "$HOME/.config/kitty"
            else
                print_warn "No valid kitty config files found to install"
                rm -rf "$temp_kitty_dir"
            fi
        else
            print_info "[DRY RUN] Would install kitty config from $SCRIPT_DIR/kitty to $HOME/.config/kitty"
            # In dry run, just show what would be copied
            for item in "$SCRIPT_DIR/kitty/"*; do
                item_name=$(basename "$item")
                if [[ "$item_name" != "kitty" && "$item_name" != "kitty.conf.bak" ]]; then
                    print_info "[DRY RUN] Would copy: $item_name"
                fi
            done
        fi
    else
        print_warn "kitty config directory not found in source directory"
    fi
}

# Function to install helix config
install_helix() {
    if [ -d "$SCRIPT_DIR/helix" ]; then
        copy_config "$SCRIPT_DIR/helix" "$HOME/.config/helix"
    else
        print_warn "helix config directory not found in source directory"
    fi
}

# Main installation function
main() {
    print_info "Starting installation of dotfiles..."

    # Install required packages
    install_packages

    # Install individual configs
    install_tmux_conf
    install_zshrc
    install_nvim
    install_kitty
    install_helix

    print_success "Dotfiles installation completed!"

    # Optionally change default shell to zsh
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        if [[ "$SHELL" != *"zsh"* ]]; then
            print_info "Consider changing your default shell to zsh: chsh -s $(which zsh)"
        fi
    fi
}

# Run main function
main "$@"