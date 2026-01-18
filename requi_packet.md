# Base packet
sudo pacman -S git curl fzf bash-completion eza
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
rm -rf ble.sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sudo pacman -S python-pip base-devel fastfetch wget

#terminal
sudo pacman -S kitty

# Font
sudo pacman -S ttf-iosevkaterm-nerd

# Lang
## Go
sudo pacman -S go
## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## Python
curl -LsSf https://astral.sh/uv/install.sh | sh

# nvim
sudo pacman -S nvim

# markdown render
sudo pacman -S glow

# tui
sudo pacman -S bottom #btm

