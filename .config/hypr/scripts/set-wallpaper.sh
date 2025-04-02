#!/bin/bash

# Set paths
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
PYWAL_CONFIG="$HOME/.cache/wal/ghostty.conf"

# Set wallpaper and generate pywal colors
swww img "$WALLPAPER" --transition-type any
wal -i "$WALLPAPER"

# Restart Waybar and reload Hyprland
killall waybar && waybar &
hyprctl reload

