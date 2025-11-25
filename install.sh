#!/usr/bin/env bash

# Dotfiles installer script for Ubuntu
# This script links the dotfiles from this repository to their correct locations in the home directory.
#
# Prerequisites: The following packages must be installed before running this script:
# - git
# - nvim (Neovim)
# - tmux
# - zsh
# - helix
# - dconf (for gnome-terminal profile installation)

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


# Function to install helix config
install_helix() {
    if [ -d "$SCRIPT_DIR/helix" ]; then
        copy_config "$SCRIPT_DIR/helix" "$HOME/.config/helix"
    else
        print_warn "helix config directory not found in source directory"
    fi
}

# Function to check for required commands
check_required_commands() {
    local required_commands=("git" "nvim" "tmux" "zsh" "helix")

    print_info "Checking for required commands..."
    local missing_commands=()

    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing_commands+=("$cmd")
        fi
    done

    if [ ${#missing_commands[@]} -gt 0 ]; then
        print_error "The following required commands are not installed: ${missing_commands[*]}"

        # Ask user what to do about missing packages
        echo ""
        echo "What would you like to do?"
        echo "1) Install missing packages (${missing_commands[*]})"
        echo "2) Skip installation of missing packages and continue"
        echo "3) Cancel installation and exit"
        echo -n "Enter your choice (1-3): "
        read -r choice

        case $choice in
            1)
                # Install missing packages (Ubuntu/Debian specific)
                print_info "Installing missing packages: ${missing_commands[*]}"
                if [ "$DRY_RUN" = false ]; then
                    sudo apt update
                    sudo apt install -y "${missing_commands[@]}"

                    # Check again after installation
                    local still_missing=()
                    for cmd in "${required_commands[@]}"; do
                        if ! command -v "$cmd" &> /dev/null; then
                            still_missing+=("$cmd")
                        fi
                    done

                    if [ ${#still_missing[@]} -gt 0 ]; then
                        print_error "Could not install the following packages: ${still_missing[*]}"
                        print_error "Please install them manually before running this script."
                        exit 1
                    else
                        print_success "All required commands are now installed."
                    fi
                else
                    print_info "[DRY RUN] Would install: ${missing_commands[*]}"
                fi
                ;;
            2)
                # Remove missing commands from required list so we can continue
                print_warn "Continuing without missing packages. Some functionality may not work."
                # We'll continue with available commands only
                ;;
            3)
                # Cancel installation
                print_info "Cancelling installation as requested."
                exit 0
                ;;
            *)
                print_error "Invalid choice. Cancelling installation."
                exit 1
                ;;
        esac
    else
        print_success "All required commands are installed."
    fi
}

# Main installation function
main() {
    print_info "Starting installation of dotfiles..."

    # Check for required commands
    check_required_commands

    # Install individual configs
    install_tmux_conf
    install_zshrc
    install_nvim
    install_helix

    print_success "Dotfiles installation completed!"

    # Install gnome-terminal profile if the dconf file exists
    if command -v dconf &> /dev/null; then
        if [ -f "$SCRIPT_DIR/rose-pine-moon.dconf" ]; then
            if [ "$DRY_RUN" = false ]; then
                dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/rose-pine-moon.dconf"
                print_success "Gnome-terminal rose-pine-moon profile installed"
            else
                print_info "[DRY RUN] Would install gnome-terminal rose-pine-moon profile"
            fi
        else
            print_warn "rose-pine-moon.dconf not found in source directory"
        fi
    else
        print_warn "dconf command not found. Skipping gnome-terminal profile installation."
    fi

    # Optionally change default shell to zsh
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        if [[ "$SHELL" != *"zsh"* ]]; then
            print_info "Consider changing your default shell to zsh: chsh -s $(which zsh)"
        fi
    fi
}

# Run main function
main "$@"