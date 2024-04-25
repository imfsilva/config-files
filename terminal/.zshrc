# =======================
# Basic configuration
# =======================
# Source p10k instant prompt configuration if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add custom and Homebrew bin directories to PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# =======================
# Oh My Zsh configuration
# =======================
export ZSH="/Users/fsilva/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# =======================
# User configuration
# =======================
# Homebrew
export PATH=/opt/homebrew/bin:$PATH
export LANG=en_US.UTF-8

# pnpm
export PNPM_HOME="/Users/fsilva/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"       # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source powerlevel10k configuration if exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =======================
# Aliases configuration
# =======================
# Zsh
alias sourcezsh="source ~/.zshrc"
alias zshconfig="ws -e ~/.zshrc"

# SSH
alias sshconfig="ws -e ~/.ssh/config"

# Utilities
alias ip="ipconfig getifaddr en0"

# Development
alias grc="/usr/local/bin/generate-react-component.sh"

# Exa
alias l="exa -l"
alias ls="exa -l"
alias la="exa -la"

# =======================
# Utility functions
# =======================
# Delete all merged branches
dam() {
  echo "=== Deleting all merged branches ==="
  git checkout master && git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d
  echo "☑️ Done!"
}

# Reset npm
npmreset() {
  echo "🔥 rm -rf node_modules" &&
  rm -rf node_modules &&
  echo "🔥 rm package-lock.json" &&
  rm package-lock.json &&
  echo "⚡️ npm i" &&
  npm i
}
