#!/bin/bash

packages=(
    alacritty
    blueman
    bluez
    bluez-utils
    bpytop
    dbeaver
    discord
    docker
    docker-compose
    gruvbox-dark-gtk 
    dunst
    fd
    feh
    ffmpegthumbnailer
    firefox
    flameshot
    font-manager
    fzf
    gnome-disk-utility
    google-chrome
    gvfs
    htop
    i3lock-color
    lazygit
    libreoffice-still
    light
    lxappearance
    man-db
    mariadb-lts-clients
    mongodb-compass
    mpv
    neofetch
    neovim
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ntfs-3g
    obsidian
    optimus-manager-qt
    gruvbox-icon-theme
    pavucontrol
    picom
    pipewire
    postman-bin
    powertop
    ranger
    redshift
    ripgrep
    rsync
    slack-desktop
    stremio
    thunar
    tmux
    tmuxinator
    ttf-dejavu
    ttf-roboto
    ttf-ubuntu-font-family
    ttf-font-awesome
    ttf-fira-mono
    tumbler
    unzip
    vi
    vim
    xclip
    acpi
    python3
    xdotool
    yad
    sysstat
    iw
    playerctl
    curl
    spotify
    ttf-jetbrains-mono-nerd
    ttf-sourcecodepro-nerd
)

echo "Updating system..."
sudo pacman -Syu

echo "Installing base packages and tools..."
sudo pacman -Sy git zsh neovim stow

echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Cloning dotfiles..."
cd ~/ && git clone https://github.com/sarunmrzn/.dotfiles

cd ~/.dotfiles || exit

echo "Linking dotfiles using Stow..."
for dir in */; do
    stow "$dir" || { echo "Failed to stow $dir"; exit 1; }
done

echo "Installing Yay..."
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si --noconfirm
cd ..

echo "Installing specified packages with Yay..."
yay -S --noconfirm "${packages[@]}"

echo "Starting Docker service..."
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "Setting up Powertop service..."
cat <<EOF | sudo tee /etc/systemd/system/powertop.service
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

echo "Installing NVM and Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 20
npm i -g yarn eslint_d @fsouza/prettierd

echo "Installing TPM for tmux..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Setting up Git configuration..."

read -p "Enter your email for personal use (ed25519): " personal_email
read -p "Enter your email for professional use (rsa): " professional_email

ssh-keygen -t ed25519 -C "$personal_email" -f ~/.ssh/id_ed25519_personal -N ""

ssh-keygen -t rsa -b 4096 -C "$professional_email" -f ~/.ssh/id_rsa_professional -N ""

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_personal
ssh-add ~/.ssh/id_rsa_professional

cat <<EOF >> ~/.ssh/config
Host github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal
    IdentitiesOnly yes

Host azure
    User git
    Hostname <azure_hostname> # Replace with actual Azure hostname
    IdentityFile ~/.ssh/id_rsa_professional
    IdentitiesOnly yes
EOF

git config --global user.name "Sarun Maharjan"
git config --global user.email "sarunmrzn@gmail.com"

echo "Installing Stylua..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install stylua

echo "Enabling Bluetooth service..."
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

echo "Configuring mouse settings..."
sudo bash -c 'cat <<EOF > /etc/X11/xorg.conf.d/70-synaptics.conf
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingDrag" "on"
    Option "NaturalScrolling" "true"
EndSection
EOF'

echo "Setting Zoom level..."
echo "Xft.dpi: 125" >> ~/.Xresources

echo "Setting permissions for light..."
sudo chmod +s /usr/bin/light

echo "Cloning zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Enabling sysstat..."
sudo systemctl enable --now sysstat

echo "Setup complete! Please restart your terminal."
