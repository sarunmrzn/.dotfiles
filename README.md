# Arch Linux Dotfiles

A comprehensive dotfiles setup for Arch Linux with Hyprland, featuring a robust installation script with backup, rollback, and dry-run capabilities.

## Features

- 🖥️ **Window Manager**: Hyprland
- 🎨 **Theme**: Arc-Dark
- 🐚 **Shell**: Zsh with Oh My Zsh
- 📦 **Package Manager**: Pacman + Yay (AUR)
- 🔧 **Development Tools**: Node.js, Rust, Docker
- 🔒 **Security**: SSH key management for GitHub and Azure DevOps
- 🔋 **Power Management**: Powertop and auto-cpufreq
- 📱 **Bluetooth Support**: Enabled by default
- 📁 **Directory Structure**: Standard XDG directories + Code directory

## Prerequisites

- Arch Linux installation
- Internet connection
- Git
- Basic knowledge of terminal usage

## Installation

### Phase 1: Basic Setup

Run the following command as root:

```bash
sudo ./install.sh
```

This will:
1. Install basic packages (git, zsh, stow, curl)
2. Change your default shell to zsh
3. Clone this repository

### Phase 2: Full Setup

After logging back in, run:

```bash
~/.dotfiles/install.sh --phase2
```

This will:
1. Install yay (AUR helper)
2. Clean existing configs (with backup)
3. Stow dotfiles
4. Install zsh plugins
5. Install all packages from packages.txt
6. Setup development environment
7. Configure Git and SSH
8. Setup Docker
9. Configure system services
10. Create standard directories

## Safety Features

- 🔄 **Backup System**: Automatically creates timestamped backups before making changes
- 🔙 **Rollback Capability**: Can restore from backup if something goes wrong
- 🧪 **Dry Run Mode**: Test the installation without making changes
- 📝 **Logging**: Detailed logs of all operations

### Using Safety Features

1. **Dry Run** (to see what would happen):
```bash
sudo ./install.sh --dry-run
~/.dotfiles/install.sh --phase2 --dry-run
```

2. **With Rollback** (if something goes wrong):
```bash
sudo ./install.sh --rollback
~/.dotfiles/install.sh --phase2 --rollback
```

3. **Check Logs**:
```bash
cat ~/.dotfiles/install.log
```

## Directory Structure

```
.dotfiles/
├── .config/           # Configuration files
├── pacman/           # Package lists
│   ├── packages.txt  # Official packages
│   └── aur-packages.txt  # AUR packages
├── backups/          # Timestamped backups
├── install.sh        # Installation script
└── install.log       # Installation logs
```

## Development Environment

The script sets up:
- Node.js (LTS) with NVM
- Rust with rustup
- ESLint and Prettier
- Stylua
- TPM for tmux

## Git Configuration

Sets up:
- Personal SSH key (ed25519) for GitHub
- Professional SSH key (RSA) for Azure DevOps
- Git user configuration
- SSH config for both services

## System Services

Enables and configures:
- Powertop for power optimization
- Auto-cpufreq for CPU frequency management
- Bluetooth service
- Docker service

## Maintenance

### Updating Package Lists

To update your package lists after installing new packages:

```bash
pacman -Qqen > ~/.dotfiles/pacman/packages.txt
pacman -Qqem > ~/.dotfiles/pacman/aur-packages.txt
```

### Updating Dotfiles

```bash
cd ~/.dotfiles
git pull
stow -R .
```

## Troubleshooting

1. **If stow fails**:
   - Remove conflicting files first
   - Use `stow -D .` to unstow everything
   - Then try `stow .` again

2. **If packages fail to install**:
   - Check the log file
   - Try running `pacman -Syu` first
   - Check if yay is properly installed

3. **If services fail to start**:
   - Check system logs: `journalctl -xe`
   - Verify service status: `systemctl status <service>`

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details. 