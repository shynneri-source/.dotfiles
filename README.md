# Shynneri's Dotfiles

A carefully crafted collection of configuration files for a productive and aesthetically pleasing development environment on Arch-based systems. This repository contains my personal dotfiles for Neovim, Kitty terminal, and Bash, designed to enhance productivity and streamline the development workflow.

## 📁 Overview

This dotfiles repository includes configurations for:

- **Neovim** - A highly customized editor setup with modern plugins and LSP integration
- **Kitty Terminal** - A fast, feature-rich terminal emulator with a beautiful color scheme
- **Bash Shell** - Enhanced shell experience with Oh My Bash and custom aliases

## ✨ Features

### Neovim Configuration
- **Modern Plugin Manager**: Using Lazy.nvim for fast and efficient plugin management
- **LSP Integration**: Full Language Server Protocol support for intelligent code completion and diagnostics
- **Autocompletion**: Powered by nvim-cmp with LSP, snippet, and buffer sources
- **Color Scheme**: Kanagawa theme for a beautiful and eye-friendly experience
- **Dashboard**: Custom alpha-nvim startup screen with quick access options
- **Custom Keymaps**: Thoughtfully designed shortcuts for enhanced productivity
  - `<leader>w` to toggle line wrapping
  - `<C-h/j/k/l>` for intuitive window navigation
  - Tab/Shift+Tab for indent/outdent in visual mode
  - Custom remapping of `1` to start of line and `0` to end of line

### Kitty Terminal Configuration
- **Font**: IosevkaTerm Nerd Font for excellent icon support
- **Color Scheme**: Soft synthwave-inspired palette with carefully chosen contrast
- **Optimized Settings**: Designed for both aesthetics and readability

### Bash Enhancements
- **Oh My Bash**: Framework for managing bash configuration
- **Zoxide**: Smart cd command that learns your habits (`cd` aliased to `z`)
- **Eza**: Modern replacement for `ls` with icons and git integration
  - `ls` → `eza --icons --group-directories-first`
  - `ll` → `eza -al --icons --group-directories-first --git`
  - `lt` → `eza --tree --level=2 --icons`
- **Bat**: Enhanced `cat` command with syntax highlighting
- **Fuzzy Finder**: Integrated fzf for efficient file and command searching
- **Enhanced Bash Completion**: Using ble.sh for advanced bash completion
- **Case-insensitive Completion**: Typing `cd doc` matches `Documents`
- **Development Tools**: Includes uv (Python package manager), Rust, Go, and more
- **Markdown Rendering**: Glow for beautiful markdown previews in terminal

## 📦 Included Tools & Dependencies

### Essential Tools (Arch Package Names)
- [Neovim](https://neovim.io/) (0.9+) - Modern vim-based editor (`neovim`)
- [Kitty](https://sw.kovidgoyal.net/kitty/) - Fast GPU-accelerated terminal
- [Oh My Bash](https://github.com/ohmybash/ohmybash) - Framework for managing bash configuration
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - Smarter cd command (`zoxide`)
- [Eza](https://github.com/eza-community/eza) - Modern replacement for ls (`eza`)
- [Bat](https://github.com/sharkdp/bat) - Cat clone with syntax highlighting (`bat`)
- [FZF](https://github.com/junegunn/fzf) - Fuzzy finder (`fzf`)
- [Nerd Fonts](https://www.nerdfonts.com/) - Iconic fonts for developers (`ttf-iosevkaterm-nerd`)
- [Ble.sh](https://github.com/akinomyoga/ble.sh) - Enhanced bash completion (`bash-completion`, plus manual install)
- [Glow](https://github.com/charmbracelet/glow) - Markdown preview in terminal (`glow`)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) - System information tool (`fastfetch`)
- [Base Development Tools](https://archlinux.org/groups/x86_64/base-devel/) - Essential build tools (`base-devel`)

### Neovim Plugins
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [Kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) - Beautiful color scheme
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [alpha-nvim](https://github.com/goolord/alpha-nvim) - Dashboard
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automatic pair completion
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons

### Development Languages & Tools
- [Go](https://go.dev/) - Compiled programming language (`go`)
- [Rust](https://www.rust-lang.org/) - Systems programming language (installed via rustup)
- [UV](https://github.com/astral-sh/uv) - Fast Python package manager (installed via script)
- [Python Pip](https://pypi.org/project/pip/) - Python package installer (`python-pip`)

## 🚀 Installation

### Prerequisites
Before installing, ensure you have the following tools installed:

```bash
# Install essential tools (Arch-based distros)
sudo pacman -S git curl fzf bash-completion eza bat zoxide python-pip base-devel fastfetch wget ttf-iosevkaterm-nerd neovim glow

# Install ble.sh for enhanced bash completion
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
rm -rf ble.sh

# Install Oh My Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install programming languages (optional)
# Go
sudo pacman -S go

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Python package manager (uv)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Kitty terminal
sudo pacman -S kitty
```

### Font Installation
The required font is already installed with the pacman command above:

```bash
# Iosevka Term Nerd Font is installed with: ttf-iosevkaterm-nerd
# No additional steps needed for Arch-based systems
```

### Clone and Install
```bash
# Clone the repository
git clone https://github.com/shynneri/dotfiles.git ~/dev/.dotfile

# Run the installer
cd ~/dev/.dotfile
./install_dotfile.sh
```

The installer will:
1. Create symbolic links from this repository to your home directory
2. Optionally backup existing configuration files
3. Set up all configurations for immediate use

## 🔧 Post-Installation Setup

After installation, launch Neovim to install plugins:

```bash
nvim
```

Then run the following command in Neovim to install all plugins:

```vim
:Lazy sync
```

## 📖 Usage Tips

### Neovim Shortcuts
- `<leader>f` - Find files
- `<leader>r` - Recent files  
- `<leader>g` - Live grep
- `<leader>w` - Toggle line wrapping
- `<C-h/j/k/l>` - Navigate between windows
- `[d` / `]d` - Navigate diagnostics
- `<leader>e` - Show diagnostic error in popup

### Terminal Shortcuts
- `cd <folder-name>` - Smart navigation with zoxide
- `ls` - List with icons and git status
- `ll` - Long format with icons and git status
- `lt` - Tree view of directory structure
- `cat <file>` - View file with syntax highlighting

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- The Neovim community for creating an amazing extensible editor
- The Kitty terminal team for a fantastic terminal experience
- All the plugin authors whose work makes this configuration possible
- The Oh My Bash community for the excellent framework