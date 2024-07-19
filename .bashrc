[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    alias mux='tmuxinator'
    alias dot='nvim ~/.dotfiles/'
    alias notes="nvim ~/notes/"

    # Screen Layouts
    alias external="~/.dotfiles/.screenlayouts/ext-only.sh"
    alias dual="~/.dotfiles/.screenlayouts/dual.sh"
    alias internal="~/.dotfiles/.screenlayouts/internal-only.sh"
    alias mirror="~/.dotfiles/.screenlayouts/dual-mirror.sh"

. "$HOME/.cargo/env"
