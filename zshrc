# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/nvm/init-nvm.sh

eval "$(zoxide init zsh)"


alias cd="z"
alias zshcfg="nvim ~/.zshrc"
alias nvimcfg="nvim ~/.config/nvim/init.vim"
alias alacfg="nvim ~/.config/alacritty/alacritty.yml"
alias pgadmin='docker run -d --name pgadmin --network="host" -e PGADMIN_DEFAULT_EMAIL="s@s.com" -e PGADMIN_DEFAULT_PASSWORD="pass" dpage/pgadmin4'
alias tmuxcfg="nvim ~/.config/tmux/tmux.conf"
alias home="cd ~"
