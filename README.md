````markdown

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

### dotfiles
```bash
    git clone https://github.com/sarunmrzn/.dotfiles

```

### Link dotfiles to home

```bash
    rm -rf ~/.config ~/.bashrc ~/.zshrc
    ln -s ~/.dotfiles/.config ~/
    ln -s ~/.dotfiles/.fonts ~/
    ln -s ~/.dotfiles/.tmux.conf ~/
    ln -s ~/.dotfiles/.bashrc ~/
    ln -s ~/.dotfiles/.zshrc ~/
```
