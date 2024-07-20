````markdown
# Arch

### WSL

```bash
    sudo pacman -Sy archlinux-keyring
    sudo archlinux-keyring
```

### WIFI

```bash
    systemctl start iwd
    iwctl
    station list
    station wlan0 scan
    station wlan0 get-networks
    station wlan0 connect 'Network'
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
        slack-bin
        docker
        docker-compose
        powertop
        auto-cpufreq
        thunar
```

### Docker stuff
```bash
    systemctl start docker.service
    docker ps
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

```

### Powertop
```
    [Unit]
    Description=Powertop tunings

    [Service]
    Type=oneshot
    RemainAfterExit=yes
    ExecStart=/usr/bin/powertop --auto-tune

    [Install]
    WantedBy=multi-user.target
```

```bash
    sudo nvim /etc/systemd/system/powertop.service
    systemctl enable powertop.service
    systemctl start powertop.service

```

### Ble
```bash
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
    make -C ble.sh install PREFIX=~/.local

```

### NVM
```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    nvm install 20
    npm i -g yarn
    npm i -g eslint_d
    npm install -g @fsouza/prettierd
```

### Git Configuration

```bash
    ssh-keygen -t ed25519 -C "<email>"
    eval "$(ssh-agent -s)" / wsl : eval $(ssh-agent -c)
    ssh-add ~/.ssh/xxx

    touch ~/.ssh/config
    nvim ~/.ssh/config

    Host github.com
        User git
        IdentityFile ~/.ssh/xxx
        IdentitiesOnly yes

    Host xxx
        User git
        Hostname xxx
        IdentityFile ~/.ssh/xxx
        IdentitiesOnly yes

    git config --global user.name "<name>"
    git config --global user.email "<email>"

```

### Link dotfiles to home

```bash
rm -rf ~/.config
rm -rf ~/.bashrc

ln -s ~/.dotfiles/.config ~/
ln -s ~/.dotfiles/.fonts ~/
sudo fc-cache -f -v
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/.bashrc ~/
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

### Fonts
```bash
    yay -S ttf-ms-win11-auto
    fc-cache --force
    fc-cache-32 --force
```

