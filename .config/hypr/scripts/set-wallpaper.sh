#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER" --transition-type any
wal -i "$WALLPAPER"

GHOSTTY_CONFIG_PYWAL="$HOME/.cache/wal/ghostty.conf"
GHOSTTY_CONFIG="$HOME/.config/ghostty/config"

awk -F= 'NF==2 {key=$1; val=$2; gsub(/^ +| +$/, "", key); gsub(/^ +| +$/, "", val); data[key]=val} END {for (k in data) print k " = " data[k]}' "$CONFIG_BASE" "$CONFIG_PYWAL" > "$CONFIG_FINAL"

# Restart Waybar and reload Hyprland
killall waybar && waybar &
hyprctl reload
