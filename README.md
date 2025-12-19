<div align="center">

# 🧰 Shyn's Dotfiles

<p align="center">
  <em>My personal collection of configuration files for a consistent and productive development environment</em>
</p>

![Shell](https://img.shields.io/badge/shell-zsh-199DBB.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Editor](https://img.shields.io/badge/editor-neovim-57A143.svg?style=for-the-badge&logo=neovim&logoColor=white)
![License](https://img.shields.io/github/license/shyn/dotfiles?style=for-the-badge)

</div>

## 📖 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Customization](#customization)
- [Backup & Recovery](#backup--recovery)
- [License](#license)

## 🔍 Overview

This repository contains my personal dotfiles, designed to provide a consistent and efficient development environment across different systems. The configuration includes:

- **Zsh shell** with Oh My Zsh and custom aliases
- **Neovim** with a comprehensive plugin suite
- Various productivity enhancements and shortcuts

## ✨ Features

### 🐚 Zsh Configuration
- **Theme**: Lambda theme for clean, informative prompt
- **Plugins**:
  - `git` - Git aliases and autocompletion
  - `zsh-autosuggestions` - Command suggestions based on history
  - `zsh-syntax-highlighting` - Syntax highlighting for commands
  - `extract` - Quick archive extraction

### 📝 Neovim Configuration
- **Plugin Manager**: Lazy.nvim for fast plugin management
- **Dashboard**: Custom startup screen
- **LSP Support**: Language Server Protocol for code intelligence
- **Treesitter**: Syntax highlighting and parsing
- **Telescope**: Fuzzy finder for files, buffers, etc.
- **Git Integration**: Git signs and functionality
- **Debugging**: Built-in debugging support

### ⌨️ Productivity Shortcuts
- Custom aliases for common commands (`ll`, `gs`, `gp`, etc.)
- History management with increased size and append mode
- Efficient navigation shortcuts (`..`, `...`)

## 🚀 Installation

### Prerequisites
- Git
- Zsh (recommended)
- Neovim (optional but recommended)

### Quick Install

```bash
# Clone the repository
git clone https://github.com/shyn/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Run the installation script
chmod +x install.sh
./install.sh
```

The installation script will:
1. Create backups of existing configuration files
2. Link the dotfiles to their appropriate locations
3. Create necessary directory structures

### Manual Installation

If you prefer to install manually:

```bash
# Link individual files
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim ~/.config/nvim
```

## ⚙️ Configuration

### Zsh Setup
After installation, the `.zshrc` file configures:
- Oh My Zsh with the Lambda theme
- Essential plugins for productivity
- Custom aliases and keybindings
- Environment variables and PATH modifications

### Neovim Setup
The Neovim configuration (`nvim/`) includes:
- **Options** (`config/options.lua`): Editor settings and options
- **Keymaps** (`config/keymaps.lua`): Custom key bindings
- **Plugin Manager** (`config/lazy.lua`): Lazy.nvim configuration
- **Plugins** (`plugins/`): Individual plugin configurations

## 🛠️ Customization

### Adding New Plugins to Neovim
Edit the appropriate file in the `lua/plugins/` directory:
- `coding.lua` - Coding assistance plugins
- `completion.lua` - Auto-completion plugins
- `lsp.lua` - LSP-related plugins
- And others...

### Modifying Zsh Configuration
Edit the `.zshrc` file directly to:
- Change the theme
- Add/remove plugins
- Modify aliases
- Adjust environment variables

### Updating the Configuration
```bash
cd ~/.dotfiles
git pull origin main
```

After updating, restart your shell or run:
```bash
source ~/.zshrc
```

## 💾 Backup & Recovery

The installation script automatically creates a backup of your existing configuration files in `~/.dotfiles_backup_<timestamp>/`. 

To restore from a backup:
```bash
# Find your backup directory
ls -la ~/.dotfiles_backup_*

# Copy files back (example)
cp -r ~/.dotfiles_backup_*/.zshrc ~/
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. If you have suggestions for improvements, please open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ by [Shyn](https://github.com/shyn)

⭐ Star this repo if you find it helpful!

</div>