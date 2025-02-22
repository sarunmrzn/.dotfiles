#!/bin/bash
hyprctl dispatch exec hyprpaper

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

INTERVAL=300

while true; do
    sleep 1
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)
    hyprctl hyprpaper reload ,"$WALLPAPER"
    wal -i "$WALLPAPER"
    sleep $INTERVAL
done
