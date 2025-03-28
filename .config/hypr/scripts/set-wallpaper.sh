#!/bin/bash

# Set paths
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
PYWAL_CONFIG="$HOME/.cache/wal/ghostty.conf"
GHOSTTY_CONFIG="$HOME/.config/ghostty/config"

# Set wallpaper and generate pywal colors
swww img "$WALLPAPER" --transition-type any
wal -i "$WALLPAPER"

# Process pywal config and update ghostty config
while IFS='=' read -r key rest; do
    # Remove leading/trailing whitespace from key and rest of the line
    key=$(echo "$key" | xargs)
    rest=$(echo "$rest" | xargs)

    # Skip empty lines or comments
    if [[ -z "$key" ]] || [[ "$key" =~ ^# ]]; then
        continue
    fi

    # Check if the key is "palette"
    if [[ "$key" == "palette" ]]; then
        # Expect value of the form: index=#HEX or index=HEX
        index=$(echo "$rest" | cut -d '=' -f1)
        color=$(echo "$rest" | cut -d '=' -f2-)
        # Ensure color starts with a '#'
        if [[ ! "$color" =~ ^# ]]; then
            color="#$color"
        fi
        replacement="palette = $index=$color"
        # Only replace the palette line with matching index in ghostty config
        sed -i "s|^palette *= *$index=.*|$replacement|" "$GHOSTTY_CONFIG"
    else
        # For non-palette keys, check if the color already starts with '#' and add it if missing
        value="$rest"
        if [[ ! "$value" =~ ^# ]]; then
            value="#$value"
        fi
        replacement="$key = $value"
        # Replace the entire line in the ghostty config that starts with the key
        sed -i "s|^$key *= *.*|$replacement|" "$GHOSTTY_CONFIG"
    fi
done < "$PYWAL_CONFIG"

# Restart Waybar and reload Hyprland
killall waybar && waybar &
hyprctl reload

