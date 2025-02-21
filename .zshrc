export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    git
    docker
    docker-compose
    fzf
    gh
    cp 
    zoxide 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-navigation-tools
)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ARCHFLAGS="-arch $(uname -m)"


eval "$(zoxide init zsh)"
ZOXIDE_CMD_OVERRIDE="true"
alias cd="z"

. "$HOME/.cargo/env"
eval 

TWILIO_AC_ZSH_SETUP_PATH=/home/sarun/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH; # twilio autocomplete setup

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.spicetify:$PATH"

alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

alias mux='tmuxinator'
alias dot='mux start dot'
alias pb='mux start pb'
alias cango='mux start cango'
alias hltr='mux start hltr'
