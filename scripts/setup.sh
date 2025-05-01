#!/usr/bin/env bash
set -euo pipefail

USER="$USER"
HOME_DIR="$HOME"
SSH_EMAIL="sarunmrzn@gmail.com"

echo "==> 1. Install & switch to Zsh"
chsh -s "$(command -v zsh)" "${USER}"

echo "==> 2. Install Oh My Zsh"
if [ ! -d "${HOME_DIR}/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> 3. Clone Zsh plugins"
ZSH_CUSTOM="${HOME_DIR}/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-completions    "${ZSH_CUSTOM}/plugins/zsh-completions"    || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" || true
echo "→ Add to ~/.zshrc: plugins=(… zsh-autosuggestions zsh-completions zsh-syntax-highlighting)"

echo "==> 4. Install NVM, Node LTS & eslint_d"
if [ ! -d "${HOME_DIR}/.nvm" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  export NVM_DIR="${HOME_DIR}/.nvm"
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
fi
nvm install --lts
npm install -g eslint_d

echo "==> 5. Generate XDG user dirs & create ~/Code"
xdg-user-dirs-update
mkdir -p "${HOME_DIR}/Code"

echo "==> 6. Install TPM (Tmux Plugin Manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "==> 7. Install & configure Docker"
sudo systemctl enable --now docker.service
sudo groupadd -f docker
sudo usermod -aG docker "${USER}"
echo "→ Log out/in so you can run docker without sudo"

echo "==> 8. Enable services: Docker, Bluetooth, auto-cpufreq"
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now auto-cpufreq.service

echo "==> 9. SSH keys & config"
SSH_DIR="${HOME_DIR}/.ssh"
mkdir -p "${SSH_DIR}"
chmod 700 "${SSH_DIR}"

ssh-keygen -t ed25519 -C "${SSH_EMAIL}" -f "${SSH_DIR}/sarun" -N ""
ssh-keygen -t rsa     -b 4096   -C "${SSH_EMAIL}" -f "${SSH_DIR}/azure" -N ""

eval "$(ssh-agent -s)"
ssh-add "${SSH_DIR}/sarun"
ssh-add "${SSH_DIR}/azure"

echo
echo "----- sarun.pub -----"
cat "${SSH_DIR}/sarun.pub"
echo
echo "----- azure.pub -----"
cat "${SSH_DIR}/azure.pub"
echo

cat > "${SSH_DIR}/config" <<EOF
Host github.com
  HostName github.com
  User git
  IdentityFile ${SSH_DIR}/sarun

Host azure
  HostName ssh.azure.com
  User git
  IdentityFile ${SSH_DIR}/azure
EOF

chmod 600 "${SSH_DIR}/config"

echo
echo "✅ Setup complete! Restart your shell (or log out/in) to apply all changes."
