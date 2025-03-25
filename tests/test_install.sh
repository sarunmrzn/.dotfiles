#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Test counter
TESTS_PASSED=0
TESTS_FAILED=0

# Function to print test results
print_result() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1${NC}"
        ((TESTS_PASSED++))
    else
        echo -e "${RED}✗ $1${NC}"
        ((TESTS_FAILED++))
    fi
}

# Function to test if a command exists
test_command_exists() {
    command -v "$1" >/dev/null 2>&1
    print_result "Command '$1' exists"
}

# Function to test if a file exists
test_file_exists() {
    [ -f "$1" ]
    print_result "File '$1' exists"
}

# Function to test if a directory exists
test_dir_exists() {
    [ -d "$1" ]
    print_result "Directory '$1' exists"
}

# Function to test if a file contains specific content
test_file_content() {
    local file="$1"
    local content="$2"
    grep -q "$content" "$file"
    print_result "File '$file' contains '$content'"
}

# Function to test if a service is enabled
test_service_enabled() {
    systemctl is-enabled "$1" >/dev/null 2>&1
    print_result "Service '$1' is enabled"
}

# Function to test if a service is running
test_service_running() {
    systemctl is-active "$1" >/dev/null 2>&1
    print_result "Service '$1' is running"
}

# Function to test if a user is in a group
test_user_in_group() {
    groups "$USER" | grep -q "$1"
    print_result "User is in group '$1'"
}

# Main test suite
main() {
    echo "Starting dotfiles installation tests..."
    echo "====================================="

    # Test basic commands
    echo -e "\nTesting basic commands..."
    test_command_exists "git"
    test_command_exists "zsh"
    test_command_exists "stow"
    test_command_exists "curl"
    test_command_exists "yay"

    # Test dotfiles structure
    echo -e "\nTesting dotfiles structure..."
    test_dir_exists "$HOME/.dotfiles"
    test_dir_exists "$HOME/.dotfiles/.config"
    test_dir_exists "$HOME/.dotfiles/pacman"
    test_file_exists "$HOME/.dotfiles/pacman/packages.txt"
    test_file_exists "$HOME/.dotfiles/pacman/aur-packages.txt"

    # Test configuration files
    echo -e "\nTesting configuration files..."
    test_file_exists "$HOME/.zshrc"
    test_file_exists "$HOME/.config/hypr/hyprland.conf"
    test_file_exists "$HOME/.config/kitty/kitty.conf"
    test_file_exists "$HOME/.config/waybar/config"

    # Test development environment
    echo -e "\nTesting development environment..."
    test_command_exists "node"
    test_command_exists "npm"
    test_command_exists "rustc"
    test_command_exists "cargo"
    test_command_exists "docker"

    # Test system services
    echo -e "\nTesting system services..."
    test_service_enabled "bluetooth.service"
    test_service_enabled "docker.service"
    test_service_enabled "powertop.service"
    test_service_enabled "auto-cpufreq.service"

    # Test user groups
    echo -e "\nTesting user groups..."
    test_user_in_group "docker"

    # Test SSH configuration
    echo -e "\nTesting SSH configuration..."
    test_file_exists "$HOME/.ssh/config"
    test_file_exists "$HOME/.ssh/sarun"
    test_file_exists "$HOME/.ssh/upfront"

    # Test Git configuration
    echo -e "\nTesting Git configuration..."
    test_file_content "$HOME/.gitconfig" "name = Sarun"
    test_file_content "$HOME/.gitconfig" "email = sarunmrzn@gmail.com"

    # Print summary
    echo -e "\nTest Summary:"
    echo "====================================="
    echo -e "${GREEN}Passed: $TESTS_PASSED${NC}"
    echo -e "${RED}Failed: $TESTS_FAILED${NC}"
    echo "====================================="

    # Exit with failure if any tests failed
    if [ $TESTS_FAILED -gt 0 ]; then
        exit 1
    fi
}

# Run tests
main 