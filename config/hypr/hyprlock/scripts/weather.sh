#!/bin/bash

cache_file="$HOME/.cache/wttr_cache.txt"
expiry_time=1800 

if [ ! -f "$cache_file" ]; then
    mkdir -p "$(dirname "$cache_file")"
    touch "$cache_file"
fi

last_modified=$(stat -c %Y "$cache_file")
current_date=$(date +%s)
time_diff=$((current_date - last_modified))
cached_data=$(cat "$cache_file" 2>/dev/null)

if (( time_diff < expiry_time )) && [[ -n "$cached_data" ]]; then
    echo "$cached_data"
    exit 0
fi

response=$(curl -s --max-time 3 "wttr.in/?format=%c+%C+%t" 2>/dev/null)

if [[ -n "$response" ]] && [[ "$response" != *"html"* ]]; then
    response=$(echo "$response" | xargs)
    
    echo "$response" > "$cache_file"
    echo "$response"
else
    if [[ -n "$cached_data" ]]; then
        echo "$cached_data"
    else
        echo "Clima no disponible 󰖪"
    fi
fi
