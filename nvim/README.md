<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://readme-typing-svg.demolab.com/?font=Iosevka+Nerd+Font&weight=600&size=40&duration=3000&pause=1000&color=7AA2F7&center=true&vCenter=true&width=800&height=100&lines=%E2%9C%A8+shynneri+%E2%9C%A8;Beautiful+Neovim+Configuration;Crafted+with+%E2%9D%A4%EF%B8%8F+and+Lua">
  <img alt="Shynneri Banner" src="https://readme-typing-svg.demolab.com/?font=Iosevka+Nerd+Font&weight=600&size=40&duration=3000&pause=1000&color=7AA2F7&center=true&vCenter=true&width=800&height=100&lines=%E2%9C%A8+shynneri+%E2%9C%A8;Beautiful+Neovim+Configuration;Crafted+with+%E2%9D%A4%EF%B8%8F+and+Lua">
</picture>

<br/>

<h3 align="center">
  <i>A beautiful, powerful Neovim configuration crafted with love</i> ❤️
</h3>

![Shynneri Nvim UI](image/ui.png)

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-powered-blue.svg?style=flat-square&logo=lua)](http://www.lua.org)
[![Lazy](https://img.shields.io/badge/plugin%20manager-lazy.nvim-orange.svg?style=flat-square)](https://github.com/folke/lazy.nvim)

</div>

---

A modern, feature-rich Neovim configuration built with Lua and powered by lazy.nvim. This configuration provides a complete IDE-like experience with LSP support, beautiful UI, and efficient workflows for multiple programming languages.

## Introduction

Shynneri Nvim is a carefully crafted Neovim configuration designed for developers who want a powerful, fast, and beautiful editing experience. It comes pre-configured with modern plugins, sensible defaults, and an intuitive keymap system that enhances productivity.

This configuration supports multiple programming languages including C/C++, Go, Python, and Lua, with full LSP (Language Server Protocol) integration, code formatting, syntax highlighting, and git integration.

## Features

- 🚀 **Lazy Loading**: Fast startup time with lazy.nvim plugin manager
- 🎨 **Beautiful UI**: Tokyo Night theme with custom dashboard, statusline, and bufferline
- 📝 **LSP Support**: Full language server support for multiple languages
- 🔍 **Fuzzy Finding**: Telescope integration for fast file and text searching
- 🌳 **Syntax Highlighting**: Tree-sitter powered syntax highlighting
- 🎯 **Code Formatting**: Automatic code formatting with conform.nvim
- 📦 **Git Integration**: Built-in git signs and commands
- 🔧 **Easy Customization**: Modular configuration structure
- ⚡ **Terminal Integration**: Built-in floating terminal with toggleterm
- 🗂️ **File Explorer**: Mini.files for quick file navigation

## Requirements

Before installing this configuration, make sure you have the following installed on your Ubuntu system:

### Essential Requirements

1. **Neovim** (>= 0.9.0)
   ```bash
   sudo apt update
   sudo apt install neovim
   ```
   Or for the latest version:
   ```bash
   sudo add-apt-repository ppa:neovim-ppa/unstable
   sudo apt update
   sudo apt install neovim
   ```

2. **Git**
   ```bash
   sudo apt install git
   ```

3. **A Nerd Font**
   - Required for icons to display properly
   - **Recommended: [Iosevka Nerd Font](https://www.nerdfonts.com/)** ⭐
   - Alternative: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/)
   - Install on Ubuntu:
   ```bash
   mkdir -p ~/.local/share/fonts
   cd ~/.local/share/fonts
   wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Iosevka.zip
   unzip Iosevka.zip
   rm Iosevka.zip
   fc-cache -fv
   ```
   - Configure your terminal to use the Nerd Font

4. **Node.js** (>= 14.x)
   ```bash
   sudo apt install nodejs npm
   ```
   Or for the latest LTS version:
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt install -y nodejs
   ```

5. **Python 3**
   ```bash
   sudo apt install python3 python3-pip python3-venv
   ```

### Language-Specific Requirements

Depending on which languages you plan to use, install the following:

#### For C/C++ Development
```bash
sudo apt install build-essential clang clangd
```

#### For Go Development
```bash
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

#### For Python Development
```bash
sudo apt install python3.8 python3-pip
```

### Optional but Recommended

```bash
# ripgrep - For faster grep searching in Telescope
sudo apt install ripgrep

# fd - For faster file finding in Telescope
sudo apt install fd-find

# make - For building telescope-fzf-native
sudo apt install build-essential

# xclip or xsel - For clipboard support
sudo apt install xclip
```

## Installation

### Step 1: Backup Existing Configuration

If you have an existing Neovim configuration, back it up first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### Step 2: Clone This Configuration

```bash
git clone https://github.com/yourusername/shynneri-nvim.git ~/.config/nvim
```

### Step 3: Install Plugins

1. Open Neovim:
   ```bash
   nvim
   ```

2. The plugin manager (lazy.nvim) will automatically:
   - Install itself
   - Install all configured plugins
   - This may take a few minutes on first launch

3. Wait for all plugins to finish installing

4. Restart Neovim after installation completes

### Step 4: Install LSP Servers and Tools

Open Neovim and run:

```vim
:Mason
```

The following will be automatically installed:
- **LSP Servers**: lua_ls, clangd, pyright, gopls
- **Formatters**: stylua, clang-format, ruff, gofumpt
- **Additional Tools**: As configured in Mason

You can also manually install additional tools through the Mason UI.

## How to Use

### Opening Neovim

Simply run `nvim` in your terminal to see the beautiful dashboard with quick access options:

```bash
nvim
```

Or open a specific file:

```bash
nvim myfile.txt
```

### Basic Navigation

- Use `h`, `j`, `k`, `l` to move left, down, up, right
- Use `<Space>` as your leader key for most commands
- Press `<Space>` and wait to see available keymaps with which-key

### Opening Files

- `<Space>e` - Open file explorer in current directory
- `<Space>E` - Open file explorer in project root
- `<Space>ff` - Find files with Telescope
- `<Space>fg` - Search text in files (grep)
- `<Space>fb` - Find open buffers

### Editing and LSP

- `gd` - Go to definition
- `gr` - Show references
- `K` - Show hover documentation
- `<Space>ca` - Code actions
- `<Space>rn` - Rename symbol
- `<Space>f` - Format current file/selection

### Buffer Management

- `Shift+l` - Next buffer
- `Shift+h` - Previous buffer
- `<Space>c` - Close current buffer

### Terminal

- `<Space>t` - Toggle floating terminal
- `<Space>th` - Toggle horizontal terminal
- `<Space>tv` - Toggle vertical terminal
- `<Space>td` - Close all terminals
- `<Esc>` or `jk` - Exit terminal mode (when in terminal)

### Git Integration

- `]c` - Next git hunk
- `[c` - Previous git hunk
- `<Space>gs` - Stage hunk
- `<Space>gr` - Reset hunk
- `<Space>gp` - Preview hunk
- `<Space>gb` - Blame line

## Customization

### Changing the Theme

Edit `lua/plugins/ui.lua`:

```lua
vim.cmd.colorscheme "tokyonight"  -- Change to your preferred theme
```

Available Tokyo Night variants: `tokyonight`, `tokyonight-night`, `tokyonight-storm`, `tokyonight-day`, `tokyonight-moon`

### Modifying Keymaps

Edit `lua/config/keymaps.lua` to add or change keybindings:

```lua
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)  -- Your custom keymaps here
```

### Adjusting Editor Options

Edit `lua/config/options.lua`:

```lua
vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.tabstop = 4            -- Tab width
-- Add more options as needed
```

### Adding New Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/myplugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

Lazy.nvim will automatically detect and load it on next startup.

### Language-Specific Configuration

- **C/C++**: Edit `lua/plugins/lang-cpp.lua`
- **Go**: Edit `lua/plugins/lang-go.lua`
- **Python**: Edit `lua/plugins/lang-python.lua`

### Customizing Dashboard

Edit `lua/plugins/dashboard.lua` to change the ASCII art or menu options.

## Configuration Structure

```
nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock file
├── lua/
│   ├── config/
│   │   ├── options.lua        # Editor options
│   │   ├── keymaps.lua        # Basic keymaps
│   │   └── autocmds.lua       # Auto commands (if exists)
│   └── plugins/
│       ├── ui.lua             # Theme and UI plugins
│       ├── telescope.lua      # Fuzzy finder
│       ├── lsp.lua            # LSP configuration
│       ├── mason.lua          # LSP/tool installer
│       ├── treesitter.lua     # Syntax highlighting
│       ├── formatter.lua      # Code formatting
│       ├── bufferline.lua     # Buffer tabs
│       ├── lualine.lua        # Status line
│       ├── dashboard.lua      # Start screen
│       ├── toggleterm.lua     # Terminal
│       ├── gitsigns.lua       # Git integration
│       ├── which-key.lua      # Keymap helper
│       ├── noice.lua          # UI enhancements
│       ├── lang-cpp.lua       # C/C++ specific
│       ├── lang-go.lua        # Go specific
│       └── lang-python.lua    # Python specific
```

## Important Keymaps

### Leader Key

- **Leader**: `<Space>` (Space bar)

### File Operations

| Keymap | Description |
|--------|-------------|
| `<Space>e` | Open file explorer (current directory) |
| `<Space>E` | Open file explorer (project root) |
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Find buffers |
| `<Space>fh` | Find help tags |

### LSP (Code Intelligence)

| Keymap | Description |
|--------|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<Space>ca` | Code action |
| `<Space>rn` | Rename symbol |
| `<Space>f` | Format file/selection |

### Buffer Management

| Keymap | Description |
|--------|-------------|
| `Shift+l` | Next buffer |
| `Shift+h` | Previous buffer |
| `<Space>c` | Close current buffer |

### Terminal

| Keymap | Description |
|--------|-------------|
| `<Space>t` | Toggle floating terminal |
| `<Space>th` | Toggle horizontal terminal |
| `<Space>tv` | Toggle vertical terminal |
| `<Space>td` | Close all terminals |
| `<Esc>` or `jk` | Exit terminal mode |

### Git

| Keymap | Description |
|--------|-------------|
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `<Space>gs` | Stage hunk |
| `<Space>gr` | Reset hunk |
| `<Space>gS` | Stage buffer |
| `<Space>gR` | Reset buffer |
| `<Space>gp` | Preview hunk |
| `<Space>gb` | Blame line |
| `<Space>gd` | Diff this |

### Telescope (Insert Mode)

| Keymap | Description |
|--------|-------------|
| `Ctrl+k` | Move selection up |
| `Ctrl+j` | Move selection down |
| `Ctrl+q` | Send to quickfix list |

### Window Navigation

| Keymap | Description |
|--------|-------------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to bottom window |
| `Ctrl+k` | Move to top window |
| `Ctrl+l` | Move to right window |

## Troubleshooting

### Plugins Not Installing

1. Check internet connection
2. Run `:Lazy sync` to retry installation
3. Run `:Lazy clean` then `:Lazy sync` to reinstall

### LSP Not Working

1. Open Mason: `:Mason`
2. Check if language server is installed
3. Install manually if needed: navigate to server and press `i`
4. Restart Neovim

### Icons Not Showing

1. Install a Nerd Font
2. Configure your terminal to use the Nerd Font
3. Restart terminal and Neovim

### Slow Startup

1. Check plugin count: `:Lazy`
2. Review lazy-loading settings
3. Run `:Lazy profile` to see load times

## Contributing

Contributions are welcome! If you have improvements or bug fixes:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

Please ensure your code follows the existing style and includes appropriate comments.

## License

This configuration is open source and available for anyone to use and modify.

## Acknowledgments

Special thanks to all the plugin authors and the Neovim community for their amazing work.

---

**Made with ❤️ and Lua by Shynn**

*Happy Coding!* ✨
