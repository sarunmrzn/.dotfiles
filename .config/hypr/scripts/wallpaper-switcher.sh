# #!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

sleep 0.5
while true; do
    CURRENT_WALL=$(hyprctl hyprpaper listloaded)
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper "*, $WALLPAPER"
    wal -i "$WALLPAPER"
    sleep 900
done
