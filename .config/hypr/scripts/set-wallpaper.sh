#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER" --transition-type any
wal -i "$WALLPAPER"

killall waybar && waybar &
hyprctl reload
