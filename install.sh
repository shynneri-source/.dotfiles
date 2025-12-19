#!/usr/bin/env bash

# Dotfiles Installation Script
# Author: Shyn
# Description: A script to link dotfiles to their correct locations

set -euo pipefail

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging Functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Banner
print_banner() {
    cat << 'EOF'
     _          _ _             _
    | |__   ___| | | ___ _ __  (_) ___  ___
    | '_ \ / _ \ | |/ _ \ '_ \ | |/ _ \/ __|
    | |_) |  __/ | |  __/ |_) || |  __/\__ \
    |_.__/ \___|_|_|\___| .__/ |_|\___||___/
                        |_|
EOF
    echo -e "${CYAN}Dotfiles Installation Script${NC}"
    echo
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        log_error "This script should not be run as root"
        exit 1
    fi
}

# Create backup directory
create_backup_dir() {
    BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    log_info "Created backup directory: $BACKUP_DIR"
}

# Backup existing files
backup_file() {
    local dest="$1"

    if [[ -e "$dest" ]] || [[ -L "$dest" ]]; then
        local backup_path="$BACKUP_DIR/$(basename "$dest")"
        if [[ -L "$dest" ]]; then
            # If it's a symlink, remove it
            rm "$dest"
            log_info "Removed existing symlink: $dest"
        else
            # If it's a regular file, move it to backup
            mv "$dest" "$backup_path"
            log_info "Backed up: $dest -> $backup_path"
        fi
    fi
}

# Install a single file/directory
install_file() {
    local source="$1"
    local dest="$2"

    # Create parent directory if it doesn't exist
    local parent_dir=$(dirname "$dest")
    mkdir -p "$parent_dir"

    backup_file "$dest"

    ln -sf "$source" "$dest"
    log_success "Linked: $(basename "$source") -> $dest"
}

# Main installation function
main() {
    print_banner
    check_root

    local DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    log_info "Dotfiles directory: $DOTFILES_DIR"

    create_backup_dir

    # Install dotfiles
    log_info "Installing dotfiles..."

    # Zsh configuration
    install_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

    # Neovim configuration
    install_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

    log_success "Dotfiles installation completed!"
    echo
    log_info "Please restart your shell or run: source ~/.zshrc"
    echo
    log_info "Backup of previous configurations stored in: $BACKUP_DIR"
}

# Run the main function
main "$@"