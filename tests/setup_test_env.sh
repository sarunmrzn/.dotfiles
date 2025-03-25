#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

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

# Function to check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then 
        print_error "Please run as root"
        exit 1
    fi
}

# Function to create test user
create_test_user() {
    local username="testuser"
    if ! id "$username" &>/dev/null; then
        useradd -m -s /bin/bash "$username"
        print_message "Created test user: $username"
    else
        print_warning "Test user already exists"
    fi
}

# Function to setup test environment
setup_test_env() {
    print_message "Setting up test environment..."
    
    # Create test directories
    mkdir -p /tmp/dotfiles_test
    cd /tmp/dotfiles_test
    
    # Copy dotfiles to test location
    cp -r "$HOME/.dotfiles" .
    
    # Create test configs
    mkdir -p .config/{hypr,kitty,waybar}
    touch .config/hypr/hyprland.conf
    touch .config/kitty/kitty.conf
    touch .config/waybar/config
    
    # Create test SSH files
    mkdir -p .ssh
    touch .ssh/config
    touch .ssh/sarun
    touch .ssh/upfront
    
    # Create test Git config
    cat > .gitconfig << 'EOF'
[user]
    name = Sarun
    email = sarunmrzn@gmail.com
EOF
    
    print_message "Test environment setup complete"
}

# Function to cleanup test environment
cleanup_test_env() {
    print_message "Cleaning up test environment..."
    
    # Remove test user
    userdel -r testuser 2>/dev/null
    
    # Remove test directories
    rm -rf /tmp/dotfiles_test
    
    print_message "Cleanup complete"
}

# Main function
main() {
    check_root
    
    case "$1" in
        "setup")
            create_test_user
            setup_test_env
            ;;
        "cleanup")
            cleanup_test_env
            ;;
        *)
            print_error "Usage: $0 {setup|cleanup}"
            exit 1
            ;;
    esac
}

# Run main function with arguments
main "$@" 