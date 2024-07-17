````markdown
# Arch

### WSL

```bash
    sudo pacman -Sy archlinux-keyring
    sudo archlinux-keyring
```

### Yay

```bash
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
```

### Packages

```bash
    yay -S
        alacritty
        arc-gtk-theme
        auto-cpufreq
        base-devel
        blueman
        bluez
        bluez-utils
        bpytop
        dbeaver
        discord
        dunst
        fd
        feh
        fish
        flameshot
        font-manager
        fzf
        git
        htop
        google-chrome
        lazygit
        libreoffice
        light
        lxappearance
        man-db
        neovim
        noto-fonts
        noto-fonts-cjk
        noto-fonts-extra
        obs-studio
        obsidian
        optimus-manager-qt
        pavucontrol
        postman-bin
        ranger
        redshift
        reflector
        ripgrep
        tmux
        tmuxinator
        unzip
        xclip
```

### Fisher & NVM

```bash
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

    fisher install jorgebucaran/nvm.fish
    nvm install lts
    npm i -g yarn prettier
    set --universal nvm_default_version 20

```

### Git Configuration

```bash
    ssh-keygen -t ed25519 -C "sarunmrzn@gmail.com"
    eval "$(ssh-agent -s)" / wsl : eval $(ssh-agent -c)
    ssh-add ~/.ssh/sarun
    touch ~/.ssh/config
    nvim ~/.ssh/config

    HostName github.com
    User git
    IdentityFile ~/.ssh/sarun
    IdentitiesOnly yes

    git config --global user.name "Sarun Maharjan"
    git config --global user.email "sarunmrzn@gmail.com"

```

### Link dotfiles to home

```bash
ln -s ~/.dotfiles/.config ~/
ln -s ~/.dotfiles/.fonts ~/
sudo fc-cache -f -v
ln -s ~/.dotfiles/.tmux.conf ~/
```

### TPM

```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Stylua

```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo install stylua
```

### Nvidia

```bash
    sudo nvim /etc/optimus-manager/optimus-manager.conf\
    optimus-manager --switch nvidia
```

### Enable/Start

```bash
    sudo systemctl start bluetooth.service
    sudo systemctl enable bluetooth.service
```

### Mouse Configuration

Location: `/etc/X11/xorg.conf.d/70-synaptics.conf`

```bash
    Section "InputClass"
        Identifier "touchpad"
        Driver "synaptics"
        MatchIsTouchpad "on"
            Option "Tapping" "on"
        Option "TappingDrag" "on"
        Option "NaturalScrolling" "true"
    EndSection


```

### Zoom 125%

Location: `~/.Xresources`
`Xft.dpi: 125`

### Xrandr Configuration

```bash
    xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --output eDP-1 --off

```
````

### WIFI

```
systemctl start iwd
iwctl
station list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect 'Network'
```
