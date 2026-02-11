# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
if [[ "$TERM" == "xterm-kitty" ]]; then
    export TERM=xterm-256color
fi
# =============================================================================
# 1. CORE SETTINGS
# =============================================================================
ZSH_THEME=""                  # Starship handles the theme
DISABLE_UPDATE_PROMPT="true"  # Silent updates
UPDATE_ZSH_DAYS=14
ENABLE_CORRECTION="false"

# History Optimization
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# --- Native Directory Navigation ---
setopt AUTO_CD           # Type 'folder_name' to cd into it
setopt AUTO_PUSHD        # 'cd' pushes history to stack
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# =============================================================================
# 2. PLUGINS
# =============================================================================
plugins=(
    git
    sudo              # Esc twice for sudo
    extract           # Extract any archive
    zsh-autosuggestions
    zsh-syntax-highlighting # Must be last
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# 3. TOOLS & KEYBINDS
# =============================================================================

# Init Starship
eval "$(starship init zsh)"

# Init FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Keybinds: Up/Down arrow searches history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# =============================================================================
# 4. ALIASES (EZA & DEV)
# =============================================================================
alias pac="sudo pacman -S"
alias pacu="sudo pacman -Syu"
alias y="yay -S"

# --- EZA (Modern ls) ---
# -a: all files, --icons: use nerd font, --group-directories-first: folders top
alias ls='eza --icons --group-directories-first'
alias ll='eza -al --icons --group-directories-first --header --git'
alias l='eza -F --icons --group-directories-first'
alias lt='eza -a --tree --level=2 --icons' # Tree view (2 levels deep)

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Dev
alias v="nvim"
alias py="python"
alias g="git"
alias gs="git status"

# =============================================================================
# 5. ENVIRONMENT
# =============================================================================
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

export VISUAL=nvim
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Created by `pipx` on 2026-02-03 02:07:11
export PATH="$PATH:/home/shyn/.local/bin"
export PATH=$HOME/.npm-global/bin:$PATH
