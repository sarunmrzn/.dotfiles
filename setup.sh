#!/bin/bash
set -euo pipefail

# TODO: sddm configuration
# clone notes repo, mechabar waybar, 

#`$ nmcli device wifi connect <SSID> --ask`

# pixelated issue
# ➜  ~ cd /usr/share/applications
# ➜  applications cat discord.desktop
# [Desktop Entry]
# Name=Discord
# StartupWMClass=discord
# Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
# GenericName=Internet Messenger
# Exec=/usr/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland
# Icon=discord
# Type=Application
# Categories=Network;InstantMessaging;
# Path=/usr/bin
# ➜  applications
#
#
# ==============================================================================
# 1. Basic System Update and Essential Package Installation
# ==============================================================================

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing essential packages: git, zsh, neovim, stow, curl..."
sudo pacman -Sy --noconfirm git zsh neovim stow curl

# ==============================================================================
# 2. Change Default Shell to Zsh
# ==============================================================================

echo "Changing default shell to zsh..."
chsh -s "$(which zsh)"

# ==============================================================================
# 3. Clone Dotfiles and Stow Them
# ==============================================================================

if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/sarunmrzn/.dotfiles "$HOME/.dotfiles"
else
  echo "Dotfiles repository already exists. Pulling latest changes..."
  cd "$HOME/.dotfiles" && git pull && cd -
fi

echo "Linking dotfiles using stow..."
cd "$HOME/.dotfiles" || { echo "Dotfiles directory not found!"; exit 1; }
for dir in */; do
    stow "$dir" || { echo "Failed to stow $dir"; exit 1; }
done
cd -

# ==============================================================================
# 4. Install Yay (AUR Helper)
# ==============================================================================

if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git "$HOME/yay"
  cd "$HOME/yay" || exit
  makepkg -si --noconfirm
  cd "$HOME"
  rm -rf "$HOME/yay"
else
  echo "yay is already installed."
fi

# ==============================================================================
# 5. Install All Desired Packages via Yay
# ------------------------------------------------------------------------------
# Here we combine your two package lists. (Some packages appear in one list
# but not the other, so this union list contains everything you mentioned.)
# ==============================================================================

packages=(
  adobe-source-code-pro-fonts
  alacritty
  blueman
  bluetui
  bluez
  bluez-utils
  bpytop
  brightnessctl
  dbeaver
  discord
  docker
  docker-compose
  fd
  ffmpeg
  ffmpegthumbnailer
  fzf
  hyprland
  uwsm
  hyprpaper
  hyprpicker
  hypridle
  hyprlock
  xdg-desktop-portalhyprland
  hyprsunset
  hyprpolkitagent
  hyprland-qt-support
  hyprcursor
  hyprutils
  hyprlang
  hyprwayland-scanner
  aquamarine
  hyprgraphics
  hyprland-qtutils
  pipewire
  pipewire-pulse
  python3
  wireplumber
  waybar
  lazygit
  mariadb-lts-clients
  neofetch
  neovim
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  nwg-look
  obsidian
  otf-font-awesome
  pavucontrol
  playerctl
  postman-bin
  powertop
  ripgrep
  rofi-lbonn-wayland-git
  rose-pine-cursor
  rose-pine-gtk-theme-full
  slack-desktop
  spotify
  stow
  swaync
  thunar
  tmux
  tmuxinator
  ttf-font-awesome
  ttf-jetbrains-mono-nerd
  unzip
  xdg-user-dirs
  zen-browser-bin
  zsh
  gvfs
  libreoffice-still
  ranger
  rsync
  tumbler
  vi
  vim
  xdotool
)

echo "Installing packages via yay..."
yay -S --noconfirm "${packages[@]}"

# ==============================================================================
# 6. Docker Service Setup
# ==============================================================================

echo "Setting up Docker service..."
sudo systemctl start docker.service
sudo groupadd -f docker
sudo usermod -aG docker "$USER"
# newgrp might not work in a non-interactive shell; ignore errors.
newgrp docker || true

# ==============================================================================
# 7. Powertop Service Setup
# ==============================================================================

echo "Setting up Powertop service..."
sudo tee /etc/systemd/system/powertop.service > /dev/null <<'EOF'
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable powertop.service
sudo systemctl start powertop.service

# ==============================================================================
# 8. Install NVM and Latest LTS Node.js with Global Packages
# ==============================================================================

echo "Installing NVM and Node.js (LTS)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into the current shell session.
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing latest LTS Node.js..."
nvm install --lts

echo "Installing global npm packages: yarn, eslint_d, @fsouza/prettierd..."
npm install -g yarn eslint_d @fsouza/prettierd

# ==============================================================================
# 9. Install TPM (Tmux Plugin Manager)
# ==============================================================================

echo "Installing TPM for tmux..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# ==============================================================================
# 10. Git Configuration and SSH Key Setup
# ==============================================================================

echo "Setting up Git configuration..."
read -rp "Enter your email for personal use (ed25519): " personal_email
read -rp "Enter your email for professional use (rsa): " professional_email

ssh-keygen -t ed25519 -C "$personal_email" -f "$HOME/.ssh/sarun" -N ""
ssh-keygen -t rsa -b 4096 -C "$professional_email" -f "$HOME/.ssh/upfront" -N ""

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/sarun"
ssh-add "$HOME/.ssh/upfront"

mkdir -p "$HOME/.ssh"
cat <<EOF >> "$HOME/.ssh/config"
Host github.com
    User git
    IdentityFile $HOME/.ssh/sarun
    IdentitiesOnly yes

Host azure
    User git
    Hostname <azure_hostname>  # Replace with your actual Azure hostname
    IdentityFile $HOME/.ssh/upfront
    IdentitiesOnly yes
EOF

git config --global user.name "Sarun"
git config --global user.email "sarunmrzn@gmail.com"

# ==============================================================================
# 11. Install Stylua (via Rust/Cargo)
# ==============================================================================

echo "Installing Stylua..."
if ! command -v cargo &>/dev/null; then
  echo "Installing Rust (rustup)..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"
fi
cargo install stylua

# ==============================================================================
# 12. Enable and Start Bluetooth Service
# ==============================================================================

echo "Enabling Bluetooth service..."
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# ==============================================================================
# 16. Install Oh My Zsh and Zsh Plugins
# ==============================================================================

echo "Installing Oh My Zsh..."
export RUNZSH=no   # Prevent immediate Zsh session switch after install.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Cloning Zsh plugins (zsh-autosuggestions and zsh-syntax-highlighting)..."
ZSH_CUSTOM=${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "Updating XDG user directories..."
xdg-user-dirs-update

# ==============================================================================
# 18. Final Message
# ==============================================================================

echo "Setup complete! Please restart your terminal or log out and log back in for all changes to take effect."
