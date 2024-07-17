[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias cdev='ssh -i "~/keys/cango-dev-api.pem" ubuntu@3.108.187.12'
alias cdevapp='ssh -i "~/keys/cango-dev-app.pem" ubuntu@13.202.55.107'

alias cprod='ssh -i "~/keys/cango-prod-api.pem" ubuntu@15.157.53.215'
alias cprodapp='ssh -i "~/keys/cango-prod-app.pem" ubuntu@15.156.242.208'

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    alias mux='tmuxinator'
    alias dot='nvim ~/.dotfiles/'
    alias notes="nvim ~/notes/"
    alias ud="docker exec -it ruby-app /bin/bash"

    alias upfront="mux start upfront"
    alias cango="mux start cango"
    alias cangofe="mux start cango-fe"
    alias hltr="mux start hltr"

    alias cda="ssh -i ~/keys/cango-dev-api.pem ubuntu@ec2-3-108-187-12.ap-south-1.compute.amazonaws.com"
    alias cpa="ssh -i ~/keys/cango-prod-api.pem ubuntu@ec2-15-157-53-215.ca-central-1.compute.amazonaws.com"

    # Screen Layouts
    alias external="~/.dotfiles/.screenlayouts/ext-only.sh"
    alias dual="~/.dotfiles/.screenlayouts/dual.sh"
    alias internal="~/.dotfiles/.screenlayouts/internal-only.sh"
    alias mirror="~/.dotfiles/.screenlayouts/dual-mirror.sh"

. "$HOME/.cargo/env"
