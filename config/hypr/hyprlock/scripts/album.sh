#!/bin/bash

album_art=$(playerctl metadata mpris:artUrl 2>/dev/null)

if [[ -z "$album_art" ]]; then
    exit 0
fi

CACHE_URL="/tmp/current_album_url.txt"
LAST_URL=$(cat "$CACHE_URL" 2>/dev/null || echo "")

if [[ "$album_art" != "$LAST_URL" ]]; then
    curl -s "${album_art}" --output "/tmp/album.png"
    echo "$album_art" > "$CACHE_URL"
    
    pkill -u $USER -SIGUSR2 hyprlock 2>/dev/null
fi
