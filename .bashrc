# ~/.bashrc

# Case-insensitive completion (typing 'cd doc' matches 'Documents')
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

export OSH="$HOME/.oh-my-bash"
OSH_THEME="agnoster" # 'agnoster' is pretty, 'font' is clean
# Plugins: Enable useful plugins for your languages
plugins=(
  git
  fzf
  colored-man-pages
)
source "$OSH/oh-my-bash.sh"

# Zoxide (Smart CD)
eval "$(zoxide init bash)"
alias cd='z'

# Eza (Better LS)
alias ls='eza --icons --group-directories-first'
alias ll='eza -al --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'

# Bat (Better Cat)
alias cat='bat --style=plain'

[[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

. "$HOME/.cargo/env"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
