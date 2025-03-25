#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then 
        print_error "Please run as root"
        exit 1
    fi
}

# Function to install packages
install_packages() {
    print_message "Installing basic packages..."
    pacman -S --noconfirm git zsh stow curl
}

# Function to change shell to zsh
change_shell() {
    print_message "Changing default shell to zsh..."
    chsh -s $(which zsh)
}

# Function to clone dotfiles
clone_dotfiles() {
    print_message "Cloning dotfiles repository..."
    if [ ! -d "$HOME/.dotfiles" ]; then
        git clone https://github.com/sarunmrzn/.dotfiles.git "$HOME/.dotfiles"
    else
        print_warning "Dotfiles directory already exists"
    fi
}

# Function to install yay
install_yay() {
    print_message "Installing yay..."
    if ! command_exists yay; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
    else
        print_warning "yay is already installed"
    fi
}

# Function to clean existing configs
clean_configs() {
    print_message "Cleaning existing configs..."
    rm -rf "$HOME/.config"
    rm -f "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.bash_profile"
}

# Function to stow dotfiles
stow_dotfiles() {
    print_message "Stowing dotfiles..."
    cd "$HOME/.dotfiles"
    stow .
}

# Function to install zsh plugins
install_zsh_plugins() {
    print_message "Installing zsh plugins..."
    # Install zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    
    # Install zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
}

# Function to install all packages from packages.txt
install_all_packages() {
    print_message "Installing all packages from packages.txt..."
    if [ -f "$HOME/.dotfiles/pacman/packages.txt" ]; then
        pacman -S --needed - < "$HOME/.dotfiles/pacman/packages.txt"
    else
        print_error "packages.txt not found!"
    fi
    
    if [ -f "$HOME/.dotfiles/pacman/aur-packages.txt" ]; then
        yay -S --needed - < "$HOME/.dotfiles/pacman/aur-packages.txt"
    else
        print_error "aur-packages.txt not found!"
    fi
}

# Function to setup development environment
setup_dev_env() {
    print_message "Setting up development environment..."
    
    # Install NVM and Node.js
    if [ ! -d "$HOME/.nvm" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install --lts
        npm install -g eslint_d prettier_d
    fi
    
    # Install Rust
    if ! command_exists rustc; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
    
    # Install stylua
    if ! command_exists stylua; then
        cargo install stylua
    fi
    
    # Install TPM for tmux
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
}

# Function to setup Git configuration
setup_git() {
    print_message "Setting up Git configuration..."
    
    # Create SSH directory
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    
    # Generate SSH keys
    if [ ! -f "$HOME/.ssh/sarun" ]; then
        ssh-keygen -t ed25519 -C "sarunmrzn@gmail.com" -f "$HOME/.ssh/sarun" -N ""
    fi
    
    if [ ! -f "$HOME/.ssh/upfront" ]; then
        ssh-keygen -t rsa -b 4096 -C "sarunmrzn@gmail.com" -f "$HOME/.ssh/upfront" -N ""
    fi
    
    # Setup SSH agent
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/sarun"
    ssh-add "$HOME/.ssh/upfront"
    
    # Create SSH config
    cat > "$HOME/.ssh/config" << 'EOF'
Host github.com
    User git
    IdentityFile ~/.ssh/sarun
    IdentitiesOnly yes

Host azure.dev
    User git
    Hostname ssh.dev.azure.com
    IdentityFile ~/.ssh/upfront
    IdentitiesOnly yes
EOF
    chmod 600 "$HOME/.ssh/config"
    
    # Configure Git
    git config --global user.name "Sarun"
    git config --global user.email "sarunmrzn@gmail.com"
}

# Function to setup Docker
setup_docker() {
    print_message "Setting up Docker..."
    systemctl start docker.service
    groupadd -f docker
    usermod -aG docker "$USER"
}

# Function to setup system services
setup_services() {
    print_message "Setting up system services..."
    
    # Setup Powertop service
    cat > /etc/systemd/system/powertop.service << 'EOF'
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
    systemctl enable powertop.service
    systemctl start powertop.service
    
    # Setup auto-cpufreq service
    systemctl enable auto-cpufreq.service
    systemctl start auto-cpufreq.service
    
    # Enable and start bluetooth service
    systemctl enable bluetooth.service
    systemctl start bluetooth.service
}

# Function to setup user directories
setup_directories() {
    print_message "Setting up user directories..."
    xdg-user-dirs-update
    mkdir -p "$HOME/Code"
}

# Main installation process
main() {
    print_message "Starting Arch Linux installation script..."
    
    # Check if running as root
    check_root
    
    # Install basic packages
    install_packages
    
    # Change shell to zsh
    change_shell
    
    # Clone dotfiles
    clone_dotfiles
    
    print_message "Basic setup completed!"
    print_message "Please log out and log back in for the shell change to take effect."
    print_message "After logging back in, run: $HOME/.dotfiles/install.sh --phase2"
}

# Phase 2 installation process
phase2() {
    print_message "Starting Phase 2 of installation..."
    
    # Install yay
    install_yay
    
    # Clean existing configs
    clean_configs
    
    # Stow dotfiles
    stow_dotfiles
    
    # Install zsh plugins
    install_zsh_plugins
    
    # Install all packages
    install_all_packages
    
    # Setup development environment
    setup_dev_env
    
    # Setup Git
    setup_git
    
    # Setup Docker
    setup_docker
    
    # Setup system services
    setup_services
    
    # Setup directories
    setup_directories
    
    print_message "Phase 2 installation completed!"
    print_message "Your system should now be fully configured!"
    print_message "Please log out and log back in for all changes to take effect."
}

# Check if phase2 flag is provided
if [ "$1" = "--phase2" ]; then
    phase2
else
    main
fi 