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
alias notes='nvim ~/Notes/Scratchpad.md'

alias pb='mux start pb'
alias cango='mux start cango'
alias hltr='mux start hltr'

. "$HOME/.cargo/env"
eval 
TWILIO_AC_ZSH_SETUP_PATH=/home/sarun/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup
