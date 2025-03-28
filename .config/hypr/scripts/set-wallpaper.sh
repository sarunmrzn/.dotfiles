#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER" --transition-type any
wal -i "$WALLPAPER"

CONFIG_BASE="$HOME/.config/ghostty/config-base"
CONFIG_PYWAL="$HOME/.cache/wal/colors-ghostty.conf"
CONFIG_FINAL="$HOME/.config/ghostty/config"

# Ensure the pywal-generated config exists
if [[ ! -f "$CONFIG_PYWAL" ]]; then
    echo "Error: Pywal config not found at $CONFIG_PYWAL"
    exit 1
fi

# Merge files while allowing pywal config to override duplicates
awk -F= 'NF==2 {key=$1; val=$2; gsub(/^ +| +$/, "", key); gsub(/^ +| +$/, "", val); data[key]=val} END {for (k in data) print k " = " data[k]}' "$CONFIG_BASE" "$CONFIG_PYWAL" > "$CONFIG_FINAL"

# Notify user
echo "Merged Ghostty config has been updated: $CONFIG_FINAL"

# Reload Ghostty (if applicable)
pkill -USR1 ghostty 2>/dev/null

# Restart Waybar and reload Hyprland
killall waybar && waybar &
hyprctl reload
