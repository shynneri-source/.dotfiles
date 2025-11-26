#!/usr/bin/env bash

# Dotfiles Installer  

set -e

# --- Configuration ---
DRY_RUN=false
if [[ "$1" == "--dry-run" ]] || [[ "$1" == "-n" ]]; then
    DRY_RUN=true
    echo "Running in dry-run mode. No changes will be made."
else
    DRY_RUN=false
fi

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- Output Functions ---
print_info() { printf "${BLUE}[INFO]${NC} $1\n"; }
print_success() { printf "${GREEN}[SUCCESS]${NC} $1\n"; }
print_warn() { printf "${YELLOW}[WARNING]${NC} $1\n"; }
print_error() { printf "${RED}[ERROR]${NC} $1\n"; }

# --- Variables ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Function: Copy Config ---
copy_config() {
    local src="$1"
    local dest="$2"

    # Backup/Remove existing
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ "$DRY_RUN" = false ]; then
            rm -rf "$dest"
        else
            print_warn "[DRY RUN] Would remove existing: $dest"
        fi
    fi

    # Create parent dir
    local parent_dir=$(dirname "$dest")
    if [ ! -d "$parent_dir" ]; then
        if [ "$DRY_RUN" = false ]; then mkdir -p "$parent_dir"; fi
        print_info "Created directory: $parent_dir"
    fi

    # Copy
    if [ "$DRY_RUN" = false ]; then
        cp -r "$src" "$dest"
    fi
    print_success "Installed: $src -> $dest"
}

# --- Function: Check Dependencies ---
check_dependencies() {
    local dependencies=("git" "nvim" "tmux" "zsh" "helix" "dconf")
    local missing=()

    print_info "Checking installed packages..."

    for cmd in "${dependencies[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done

    if [ ${#missing[@]} -eq 0 ]; then
        print_success "All required packages are detected."
        return
    fi

    # Logic: Ask user what to do if packages are missing
    print_warn "The following packages are MISSING: ${missing[*]}"
    echo ""
    echo "What would you like to do?"
    echo "1) Cancel installation (Exit so you can install packages manually)"
    echo "2) Proceed anyway (Install config files even though packages are missing)"
    echo -n "Enter choice (1 or 2): "
    read -r choice

    case $choice in
        1)
            print_error "Installation cancelled by user."
            echo "Please run: sudo apt install ${missing[*]}"
            exit 0
            ;;
        2)
            print_warn "Proceeding with configuration installation..."
            ;;
        *)
            print_error "Invalid choice. Exiting."
            exit 1
            ;;
    esac
}

# --- Main Logic ---
main() {
    print_info "Starting Dotfiles Installation..."

    # 1. Check for packages first
    check_dependencies

    # 2. Tmux
    if [ -f "$SCRIPT_DIR/.tmux.conf" ]; then
        copy_config "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
    fi

    # 3. Zsh
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        copy_config "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    fi

    # 4. Neovim
    if [ -d "$SCRIPT_DIR/nvim" ]; then
        copy_config "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
    fi

    # 5. Helix
    if [ -d "$SCRIPT_DIR/helix" ]; then
        copy_config "$SCRIPT_DIR/helix" "$HOME/.config/helix"
    fi

    # 6. Gnome Terminal (Dconf)
    if [ -f "$SCRIPT_DIR/rose-pine-moon.dconf" ]; then
        if command -v dconf &> /dev/null; then
            if [ "$DRY_RUN" = false ]; then
                dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/rose-pine-moon.dconf"
                print_success "Gnome-terminal profile loaded"
            else
                print_info "[DRY RUN] Would load gnome-terminal profile"
            fi
        else
            print_warn "Skipping Gnome Terminal profile (dconf command not found)"
        fi
    fi

    print_success "Dotfiles installation completed!"
}

main "$@"
