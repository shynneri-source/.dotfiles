# Base Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"  # Simple default theme

plugins=(
  git                     # Git aliases and completions
  zsh-autosuggestions     # Command autosuggestions
  zsh-syntax-highlighting # Syntax highlighting
  extract                 # Quick extraction of archives
)

source $ZSH/oh-my-zsh.sh

# Useful aliases
alias ll='ls -lah'
alias gs='git status'
alias gp='git push'
alias ga='git add'
alias gc='git commit'
alias ..='cd ..'
alias ...='cd ../..'

# Enable history substring search if available
if type history-search-end >/dev/null 2>&1; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Load fzf if installed
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Minimal prompt customization
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Increase history size and enable append mode
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt inc_append_history

# Load plugins manually if not loaded automatically
[[ -f ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin:$HOME/.cargo/bin:$HOME/.local/bin
