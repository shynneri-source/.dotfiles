# 🔧 Dotfiles

Personal configuration files for development environment setup on Linux systems.

## 📦 What's Included

### Neovim (`nvim/`)
Modern Neovim configuration powered by lazy.nvim plugin manager.
- **Plugin Manager**: lazy.nvim with automatic plugin management
- **Structure**: Modular configuration split into core settings, keymaps, and plugins
- **Location**: `~/.config/nvim/`

### Kitty (`kitty/`)
GPU-accelerated terminal emulator configuration.
- **Font**: Customizable Nerd Font support
- **Theme**: Modern themes with transparency support
- **Features**: Fast, feature-rich, highly configurable
- **Location**: `~/.config/kitty/`

### Zsh (`.zshrc`)
Shell configuration with Oh My Zsh framework.
- **Theme**: Robbyrussell (clean and minimal)
- **Plugins**: git, zsh-autosuggestions, zsh-syntax-highlighting, extract
- **Tools**: NVM integration, fzf support, custom aliases
- **History**: 10,000 entries with append mode
- **Location**: `~/.zshrc`

### Tmux (`.tmux.conf`)
Terminal multiplexer for efficient workflow.
- **Prefix**: `Ctrl+a` (easier than default `Ctrl+b`)
- **Features**: Vi keybindings, clipboard integration (xclip), custom status bar
- **Keybinds**: `|` for vertical split, `-` for horizontal split
- **History**: 10,000 lines scrollback
- **Location**: `~/.tmux.conf`

### Git (`.gitconfig`)
Comprehensive Git configuration with productivity aliases.
- **Editor**: Vim
- **Branch**: main as default
- **Merge**: zdiff3 conflict style with vimdiff tool
- **Aliases**: 30+ shortcuts for common operations
- **Location**: `~/.gitconfig`

## 🚀 Quick Install

### Prerequisites
```bash
# Install required packages
sudo apt update && sudo apt install -y git zsh tmux neovim curl xclip

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/$USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install Kitty (optional)
sudo apt install -y kitty

# Install Nerd Fonts (optional, for Kitty)
# Visit: https://www.nerdfonts.com/font-downloads
```

### Installation
```bash
# Clone this repository
git clone https://github.com/shynneri-source/.dotfiles.git /home/$USER/dotfiles
cd /home/$USER/dotfiles

# Create symbolic links
ln -sf /home/$USER/dotfiles/.zshrc /home/$USER/.zshrc
ln -sf /home/$USER/dotfiles/.tmux.conf /home/$USER/.tmux.conf
ln -sf /home/$USER/dotfiles/.gitconfig /home/$USER/.gitconfig
ln -sf /home/$USER/dotfiles/nvim /home/$USER/.config/nvim
ln -sf /home/$USER/dotfiles/kitty /home/$USER/.config/kitty

# Source the configuration
source /home/$USER/.zshrc
```

## 📝 Configuration Details

### Neovim Keybindings
The Neovim configuration uses a modular approach. Check `nvim/lua/config/keymaps.lua` for custom keybindings.

### Git Aliases (Top Picks)
```bash
git st          # Status (short format)
git l           # Log (last 20 commits, graph)
git lg          # Pretty log with graph
git d           # Diff
git ds          # Diff staged
git cleanup     # Delete merged branches
git today       # Show today's commits
```

### Tmux Keybindings
- **Prefix**: `Ctrl+a`
- `Ctrl+a |` - Split vertical
- `Ctrl+a -` - Split horizontal
- `Ctrl+a r` - Reload config
- Vi keys in copy mode

### Zsh Aliases
```bash
ll              # ls -lah (detailed list)
gs              # git status
gp              # git push
ga              # git add
gc              # git commit
..              # cd ..
...             # cd ../..
```

## 🎨 Customization

### Update Git User Info
Edit `.gitconfig` and add your email:
```ini
[user]
    email = your-email@example.com
    name = Your Name
```

### Change Terminal Theme
Edit `kitty/kitty.conf` and modify the theme settings or include a different theme file.

### Modify Zsh Theme
Edit `.zshrc` and change:
```bash
ZSH_THEME="your-theme-name"
```

## 🔄 Updates

To update configurations:
```bash
cd /home/$USER/dotfiles
git pull origin main
```

Neovim plugins will auto-update via lazy.nvim checker.

## 📚 Additional Tools

### Recommended Installations
- **fzf**: Fuzzy finder for command history and file search
- **NVM**: Node Version Manager (already integrated in .zshrc)
- **ripgrep**: Fast grep alternative for code search
- **fd**: Fast find alternative

```bash
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$USER/.fzf
/home/$USER/.fzf/install

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

## 🐛 Troubleshooting

### Zsh plugins not loading
Ensure plugins are installed in `/home/$USER/.oh-my-zsh/custom/plugins/`

### Tmux colors not working
Add to your shell rc: `export TERM=xterm-256color`

### Neovim plugins not loading
Run `:Lazy sync` inside Neovim to sync all plugins

### Kitty font issues
Install Nerd Fonts or change font in `kitty/kitty.conf` to any installed font

## 📄 License

Free to use and modify for personal use.

## 🤝 Contributing

Feel free to fork and customize for your own needs. Pull requests welcome!

---

**Note**: Remember to backup your existing configuration files before installing these dotfiles.
