# .zshrc
#
# ZSH configuration
# Homebrew
# Nvm (Node Version Manager)
# SSH
# Fuzzy Finder
# Misc

#
# ZSH configuration
#

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="ys"

# Plugins
plugins=(git systemadmin)

# Run OMZ
source $ZSH/oh-my-zsh.sh

# Configure ZSH config
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"

#
# Homebrew
#

# For HomeBrew (arm64 and x86_64)
#export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:~/bin:$PATH
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Brew Maintenance
alias brewup="brew update && brew upgrade && brew cleanup -s && brew upgrade --cask && brew doctor"
alias brewdoctor="brew doctor && brew missing"
alias brewdump='brew bundle dump --file="$HOME/Repos/Brewfile-$(hostname)" -f'

#
# Nvm (Node Version Manager)
#

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#
# SSH
#

# Git agents
alias gitagentloader="eval "$(ssh-agent)" && ssh-add ~/.ssh/github_key"
alias gitagentkiller="ssh-agent -k"
alias gitagentArcher="killall ssh-agent"

# SSH
alias ssh_edit_known_hosts="vim ~/.ssh/known_hosts"

#
# Fuzzy Finder
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'
export FZF_DEFAULT_OPTS=' --preview="bat --color=always {}" --preview-window=right:60%:wrap'
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

#
# Misc
#

# For Tmuxp
export DISABLE_AUTO_TITLE='true'

# Vim -> Neovim
alias vim="nvim"

# Quick HTTP server
alias simpleserver="python3 -m http.server"

# Jump to directories
# macOS Directories
alias icloud_drive="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

