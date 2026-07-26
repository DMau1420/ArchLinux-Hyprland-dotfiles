#!/bin/bash

# Ruta de tu imagen por defecto (ajusta el path si es necesario)
DEFAULT_IMG="$HOME/.config/hypr/hyprlock/scripts/no_album.png"
CACHE_URL="/tmp/current_album_url.txt"
LAST_URL=$(cat "$CACHE_URL" 2>/dev/null || echo "")

album_art=$(playerctl metadata mpris:artUrl 2>/dev/null)

# Si no hay album art o playerctl falla
if [[ -z "$album_art" ]]; then
    if [[ "$LAST_URL" != "default" ]]; then
        cp "$DEFAULT_IMG" "/tmp/album.png"
        echo "default" > "$CACHE_URL"
        pkill -u $USER -SIGUSR2 hyprlock 2>/dev/null
    fi
    exit 0
fi

# Si hay album art y cambió respecto a la última guardada
if [[ "$album_art" != "$LAST_URL" ]]; then
    curl -s "${album_art}" --output "/tmp/album.png"
    echo "$album_art" > "$CACHE_URL"
    
    pkill -u $USER -SIGUSR2 hyprlock 2>/dev/null
fi
