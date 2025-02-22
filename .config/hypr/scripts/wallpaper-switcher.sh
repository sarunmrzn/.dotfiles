#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

INTERVAL=900

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)
    hyprctl hyprpaper reload ,"$WALLPAPER"
    wal -i "$WALLPAPER"
    sleep $INTERVAL
done
