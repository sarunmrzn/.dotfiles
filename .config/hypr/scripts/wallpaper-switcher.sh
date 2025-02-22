#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

INTERVAL=300

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)
    hyprctl hyprpaper reload ,"$WALLPAPER"
    sleep $INTERVAL
done
