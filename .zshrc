export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(z git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ARCHFLAGS="-arch $(uname -m)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias mux='tmuxinator'

alias dot='nvim ~/.dotfiles/'
alias ncfg='nvim ~/.dotfiles/.config/nvim/'

alias pb='mux start pb'
alias cango='mux start cango'
alias hltr='mux start hltr'

alias external="~/.dotfiles/.screenlayouts/ext-only.sh"
alias dual="~/.dotfiles/.screenlayouts/dual.sh"
alias internal="~/.dotfiles/.screenlayouts/internal-only.sh"
alias mirror="~/.dotfiles/.screenlayouts/dual-mirror.sh"

. "$HOME/.cargo/env"
