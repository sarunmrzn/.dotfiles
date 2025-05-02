#!/bin/bash

set -e

# ---------- Pacman Packages ----------
pacman_packages=(
    7zip adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts alacritty discord tldr
    blueman bluez bpytop brightnessctl btrfs-progs catfish chafa clipman font-manager
    dbeaver docker docker-compose eza fastfetch fd ffmpeg ffmpegthumbnailer file-roller gnome-disk-utility
    fzf git grim gruvbox-dark-gtk gruvbox-dark-icons-gtk gst-plugin-pipewire gvfs imagemagick
    lazydocker lazygit libgnome-keyring luarocks mariadb-lts-clients neovim libreoffice-still
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nwg-look otf-font-awesome pavucontrol poppler
    poppler-glib posting ripgrep rofi-wayland rofimoji slurp smartmontools sof-firmware stow
    swaync thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman qt5-wayland
    tmux tmuxinator ttf-font-awesome ttf-jetbrains-mono-nerd tumbler vim waybar duf
    wdisplays wf-recorder wl-clipboard wlsunset cava cmatrix pipes.sh gimp vlc mpv hostctl
    wtype xdg-desktop-portal xdg-desktop-portal-wlr xdg-user-dirs xdg-utils sshs lazysql lazyjournal
    xorg-server xorg-xinit xorg-xwayland zoxide zsh ntfs-3g cheese galculator obsidian
)

# ---------- AUR Packages ----------
aur_packages=(
    brave-bin cursor-bin postman-bin redisinsight-bin visual-studio-code-bin yazi yt-dlp tor-browser-bin
)

# ---------- Install Pacman Packages ----------
echo "🔧 Installing packages via pacman..."
sudo pacman -Syu --noconfirm "${pacman_packages[@]}"

# ---------- Install yay if not found ----------
if ! command -v yay &> /dev/null; then
    echo "📦 yay not found, installing from AUR manually..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit 1
    makepkg -si --noconfirm
    cd - || exit 1
    rm -rf /tmp/yay
else
    echo "✅ yay is already installed."
fi

# ---------- Install AUR packages with yay ----------
echo "📦 Installing AUR packages via yay..."
yay -S --noconfirm "${aur_packages[@]}"
