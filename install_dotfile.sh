#!/usr/bin/env bash

# ==============================================================================
# DOTFILES INSTALLATION UTILITY
#
# Description: Automates the deployment of configuration files and package
#              installation based on the detected operating system.
# Author:      Shynneri
# ==============================================================================

# Exit immediately if a command exits with a non-zero status
set -e

# ==============================================================================
# CONFIGURATION & CONSTANTS
# ==============================================================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${HOME}/.config/backup_$(date +%Y%m%d_%H%M%S)"

# ANSI Color Codes for logging
COLOR_RESET="\033[0m"
COLOR_INFO="\033[0;34m"    # Blue
COLOR_SUCCESS="\033[0;32m" # Green
COLOR_WARN="\033[0;33m"    # Yellow
COLOR_ERROR="\033[0;31m"   # Red

# List of required packages for Arch Linux environment
ARCH_PACKAGES=(
    "git"
    "curl"
    "fzf"
    "zsh"
    "starship"
    "eza"
    "unzip"
    "python-pip"
    "base-devel"
    "fastfetch"
    "wget"
    "brightnessctl"
    "wireplumber"
    "network-manager-applet"
    "pamixer"
    "hyprlock"
    "hyprpaper"
    "hyprland"
    "hypridle"
    "waybar"
    "kitty"
    "ttf-iosevkaterm-nerd"
    "ttf-jetbrains-mono-nerd"
    "noto-fonts-emoji"
    "go"
    "nvim"
    "bottom"
)

# ==============================================================================
# UTILITY FUNCTIONS
# ==============================================================================

log_info() {
    echo -e "${COLOR_INFO}[INFO]${COLOR_RESET} $1"
}

log_success() {
    echo -e "${COLOR_SUCCESS}[OK]${COLOR_RESET} $1"
}

log_warn() {
    echo -e "${COLOR_WARN}[WARN]${COLOR_RESET} $1"
}

log_error() {
    echo -e "${COLOR_ERROR}[ERROR]${COLOR_RESET} $1"
}

# ------------------------------------------------------------------------------
# Function: create_symlink
# Description: Backs up existing files and creates a symbolic link.
# Arguments:
#   $1 - Source path (in dotfiles)
#   $2 - Destination path (in system)
# ------------------------------------------------------------------------------
create_symlink() {
    local src="$1"
    local dest="$2"

    # Verify source existence
    if [[ ! -e "$src" ]]; then
        log_warn "Source not found, skipping: $src"
        return
    fi

    # Create parent directory if missing
    mkdir -p "$(dirname "$dest")"

    # Handle existing destination artifacts
    if [[ -e "$dest" || -L "$dest" ]]; then
        if [[ "$PERFORM_BACKUP" == "true" ]]; then
            # Create backup directory structure dynamically
            local rel_path="${dest#$HOME/}"
            local backup_target="${BACKUP_DIR}/${rel_path}"
            mkdir -p "$(dirname "$backup_target")"

            mv "$dest" "$backup_target"
            log_info "Backed up existing config to: $backup_target"
        else
            rm -rf "$dest"
            log_info "Removed existing config: $dest"
        fi
    fi

    # Create symlink
    ln -s "$src" "$dest"
    log_success "Linked: $src -> $dest"
}

# ==============================================================================
# MAIN EXECUTION FLOW
# ==============================================================================

# 1. Initialization
log_info "Initializing Dotfiles Setup..."
log_info "Source Directory: $DOTFILES_DIR"

# 2. User Prompt for Backup Strategy
read -p "Perform backup of existing configurations? (y/n): " backup_choice
if [[ "$backup_choice" =~ ^[Yy]$ ]]; then
    PERFORM_BACKUP="true"
    log_info "Backup enabled. Artifacts will be stored in: $BACKUP_DIR"
else
    PERFORM_BACKUP="false"
    log_warn "Backup disabled. Existing configurations will be overwritten."
fi

# 3. OS Detection & Scope Definition
if [[ -f "/etc/arch-release" ]]; then
    IS_ARCH=true
    log_info "Detected OS: Arch Linux (Full Environment Setup)"
else
    IS_ARCH=false
    log_info "Detected OS: Generic/Non-Arch (Minimal Setup: Editor & Shell)"
fi

# 4. Package Installation (Arch Linux Only)
if [[ "$IS_ARCH" == "true" ]]; then
    log_info "Updating system and installing required packages..."
    if sudo pacman -S --needed --noconfirm "${ARCH_PACKAGES[@]}"; then
        log_success "Package installation completed successfully."
    else
        log_error "Package installation failed."
        exit 1
    fi

    # Install Oh My Zsh
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        log_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        log_success "Oh My Zsh installed successfully."
    else
        log_info "Oh My Zsh already installed."
    fi

    # Install zsh plugins
    if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]]; then
        log_info "Installing zsh-autosuggestions plugin..."
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        log_success "zsh-autosuggestions plugin installed."
    else
        log_info "zsh-autosuggestions plugin already installed."
    fi

    if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
        log_info "Installing zsh-syntax-highlighting plugin..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        log_success "zsh-syntax-highlighting plugin installed."
    else
        log_info "zsh-syntax-highlighting plugin already installed."
    fi

    # Install Rust if not already installed
    if ! command -v rustc &> /dev/null; then
        log_info "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        log_success "Rust installed successfully."
    else
        log_info "Rust already installed."
    fi

    # Install Python uv if not already installed
    if ! command -v uv &> /dev/null; then
        log_info "Installing Python uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        log_success "Python uv installed successfully."
    else
        log_info "Python uv already installed."
    fi

    # Enable and start pipewire services
    log_info "Enabling Pipewire services..."
    systemctl --user enable --now pipewire pipewire-pulse wireplumber
    log_success "Pipewire services enabled and started."

    # Optional: AUR Helper check (yay/paru)
    if command -v yay &> /dev/null; then
        log_info "AUR helper detected. Installing additional tools..."
        # Add AUR packages here if necessary
    fi
else
    log_info "Skipping package installation for non-Arch system."
fi

# 5. Configuration Deployment (Symlinks)

log_info "Deploying configurations..."

# --- Universal Configurations (Applied to all systems) ---
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Check for ZSH config in dotfiles root or config folder
if [[ -f "$DOTFILES_DIR/.zshrc" ]]; then
    create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

# Check for Starship config
if [[ -f "$DOTFILES_DIR/starship.toml" ]]; then
    create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
fi

# --- Arch / Hyprland Specific Configurations ---
if [[ "$IS_ARCH" == "true" ]]; then
    create_symlink "$DOTFILES_DIR/hypr" "$HOME/.config/hypr"
    create_symlink "$DOTFILES_DIR/waybar" "$HOME/.config/waybar"
    create_symlink "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"

    # Ensure scripts are executable
    if [[ -d "$DOTFILES_DIR/hypr/conf" ]]; then
        chmod +x "$DOTFILES_DIR/hypr/conf/"*.sh 2>/dev/null
        log_success "Set execution permissions for Hyprland scripts."
    fi
fi

# ==============================================================================
# COMPLETION
# ==============================================================================

echo ""
log_success "Dotfiles installation completed successfully."
if [[ "$IS_ARCH" == "true" ]]; then
    log_info "Recommendation: Restart your session or reload Hyprland."
else
    log_info "Recommendation: Restart your shell to apply changes."
fi
