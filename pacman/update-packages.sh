#!/bin/bash

# Update official packages list
echo "Updating official packages list..."
pacman -Qqen > packages.txt

# Update AUR packages list
echo "Updating AUR packages list..."
pacman -Qqem > aur-packages.txt

echo "Package lists updated successfully!" 