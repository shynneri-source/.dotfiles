# Base Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export COLORTERM=truecolor

# Theme - lambda is a clean theme that shows detailed hostname without user placeholder
ZSH_THEME="lambda"

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
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
