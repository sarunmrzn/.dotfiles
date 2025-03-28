export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(zoxide zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt appendhistory 
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_ignore_space

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='ghostty'
export BROWSER='brave'

export XDG_DATA_DIRS=/usr/share:/usr/local/share:$XDG_DATA_DIRS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(zoxide init zsh)"
alias cd='z'

# Load pywal colors
[ -f "$HOME/.cache/wal/colors.sh" ] && source "$HOME/.cache/wal/colors.sh"

# Aliases for exa
alias l='exa -l'          # List files in long format
alias la='exa -la'         # List all files in long format
alias lt='exa -T'          # Tree view
alias lta='exa -lT'        # Tree view in long format
alias lg='exa --git'       # Show git status
alias lga='exa -la --git'  # Show all files with git status

alias dot='nvim ~/.dotfiles'  # Show all files with git status
alias notes='nvim ~/Documents/notes/'  # Show all files with git status
