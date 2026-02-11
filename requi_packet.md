# Base packet
sudo pacman -S git curl fzf zsh starship eza unzip fd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo pacman -S python-pip base-devel fastfetch wget
sudo pacman -S brightnessctl wireplumber network-manager-applet
sudo pacman -S pamixer
sudo pacman -S pipewire-pulse
systemctl --user enable --now pipewire pipewire-pulse wireplumber
sudo pacman -S hyprlock
sudo pacman -S hyprpaper
sudo pacman -S fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-unikey
sudo pacman -S docker docker-compose docker-buildx
sudo pacman -S imagemagick luarocks
sudo pacman -S lua51
sudo pacman -S python-pipx
pipx ensurepath
sudo pacman -S wl-clipboard
sudo pacman -S hyprshot
sudo pacman -S hyprpolkitagent
sudo pacman -S npm
# terminal
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

# tui
sudo pacman -S bottom #btm

# npm global
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# remap keyboard
sudo pacman -S keyd
sudo servicectl enable keyd

cat << 'EOF' | tee -a ~/.bashrc ~/.zshrc
# Fix for 'xterm-kitty' unknown terminal type
if [[ "$TERM" == "xterm-kitty" ]]; then
    export TERM=xterm-256color
fi
EOF
