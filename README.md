# Shyn's Dotfiles

<p align="center">
  <img src="https://img.shields.io/badge/status-active-brightgreen?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/platform-Linux-informational?style=for-the-badge&logo=linux" alt="Platform">
</p>

<p align="center">
  My personal collection of configuration files for a beautiful and efficient Linux desktop environment.
</p>

## 🌟 Features

- **Hyprland Configuration**: Custom window manager setup with smooth animations and efficient tiling
- **Neovim Setup**: Modern, fast, and extensible editor configuration
- **Kitty Terminal**: Beautiful and performant terminal emulator settings
- **Waybar**: Elegant and informative status bar with system monitoring
- **Starship Prompt**: Fast and customizable shell prompt
- **Zsh Configuration**: Enhanced shell experience with plugins and customizations

## 📁 Structure

```
├── .zshrc                 # Zsh shell configuration
├── starship.toml          # Starship prompt configuration
├── install_dotfile.sh     # Installation script
├── requi_packet.md        # Required packages documentation
├── hypr/                  # Hyprland window manager configs
│   ├── hyprland.conf      # Main Hyprland configuration
│   ├── hyprlock.conf      # Lock screen configuration
│   ├── hyprpaper.conf     # Wallpaper configuration
│   ├── conf/              # Additional Hyprland configurations
│   └── pics/              # Wallpapers and images
├── kitty/                 # Kitty terminal configurations
│   └── kitty.conf
├── nvim/                  # Neovim configuration
│   ├── init.lua           # Main Neovim configuration
│   ├── lazy-lock.json     # Plugin lock file
│   └── lua/               # Lua modules
└── waybar/                # Waybar status bar configurations
    ├── config.jsonc       # Waybar configuration
    └── style.css          # Styling for Waybar
```

## 🚀 Installation

### Prerequisites

Before installing these dotfiles, ensure you have the following packages installed:

```bash
# Install required packages
sudo pacman -S hyprland kitty neovim zsh starship waybar swaybg swaylock hyprpaper
```

For other distributions, adjust the package manager command accordingly.

### Quick Install

```bash
# Clone the repository
git clone https://github.com/shyn/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Run the installation script
./install_dotfile.sh
```

### Manual Installation

Alternatively, you can manually copy the configuration files to their respective locations:

```bash
# Copy configurations (backup your existing configs first!)
cp -r hypr/ ~/.config/hypr
cp -r kitty/ ~/.config/kitty
cp -r nvim/ ~/.config/nvim
cp -r waybar/ ~/.config/waybar
cp starship.toml ~/.config/starship.toml
cp .zshrc ~/
```

## ⚙️ Customization

### Hyprland

- Window management rules and keybindings in `hypr/hyprland.conf`
- Lock screen appearance in `hypr/hyprlock.conf`
- Wallpaper settings in `hypr/hyprpaper.conf`

### Neovim

- Modern Lua-based configuration in `nvim/init.lua`
- Plugin management with Lazy.nvim
- Custom keybindings and mappings

### Waybar

- Status bar modules and layout in `waybar/config.jsonc`
- Styling in `waybar/style.css`

### Kitty Terminal

- Appearance and behavior in `kitty/kitty.conf`

### Zsh & Starship

- Shell enhancements in `.zshrc`
- Prompt customization in `starship.toml`

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## 💬 Support

If you have any questions or need help with the setup, feel free to reach out!

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/shynneri-source">Shyn</a>
</p>
