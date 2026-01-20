# ~/.bashrc

if [[ "$TERM" == "xterm-kitty" ]] || [[ -n "$KITTY_PID" ]]; then
    export TERM=xterm-256color
    export COLORTERM=truecolor
fi

# Case-insensitive completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

export OSH="$HOME/.oh-my-bash"
OSH_THEME="agnoster"

plugins=(
  git
  fzf
  colored-man-pages
)

source "$OSH/oh-my-bash.sh"

# Eza (Better LS)
alias ls='eza --icons --group-directories-first'
alias ll='eza -al --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'

# --- LOAD BLE.SH ---
# (Config is now in ~/.blerc, where it belongs)
[[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

export VISUAL=nvim
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
