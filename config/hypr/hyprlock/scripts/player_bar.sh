#!/bin/bash

# Configuration
BAR_LENGTH=10 
COLOR_PLAYED="#1DB954"      # Spotify Green
COLOR_REMAINING="#FFFFFF40" # Light gray, transparent
SPACE_CHAR="—"
STATIC_HANDLE="⦿" 

# 1. Obtener estado actual (playerctl elige automáticamente el reproductor activo)
status=$(playerctl status 2>/dev/null)
if [[ "$status" != "Playing" && "$status" != "Paused" ]]; then
    echo ""
    exit 0
fi

# 2. Obtener posición (segundos) y longitud (convertida de microsegundos a segundos)
pos=$(playerctl position 2>/dev/null | cut -d '.' -f1 || echo 0)
len_micro=$(playerctl metadata mpris:length 2>/dev/null || echo 0)
len=$(( len_micro / 1000000 ))

if (( len <= 0 )); then
    echo ""
    exit 0
fi

# 3. Calcular progreso en la barra
progress=$(( pos * BAR_LENGTH / len ))
(( progress > BAR_LENGTH )) && progress=$BAR_LENGTH
[[ "$status" == "Playing" && "$progress" -eq 0 ]] && progress=1

# 4. Construir la barra de progreso usando trucos nativos de Bash (¡Sin bucles!)
printf -v spaces "%${BAR_LENGTH}s"
all_chars="${spaces// /$SPACE_CHAR}"

if (( progress >= BAR_LENGTH )); then
    final_bar="<span foreground=\"$COLOR_PLAYED\">$all_chars</span>"
else
    bar_played="${all_chars:0:progress}"
    bar_remaining="${all_chars:progress+1}"
    final_bar="<span foreground=\"$COLOR_PLAYED\">$bar_played</span><span foreground=\"#ffffff\">$STATIC_HANDLE</span><span foreground=\"$COLOR_REMAINING\">$bar_remaining</span>"
fi

# 5. Formatear los tiempos (m:ss) directamente con printf
printf -v pos_fmt "%d:%02d" $((pos / 60)) $((pos % 60))
printf -v len_fmt "%d:%02d" $((len / 60)) $((len % 60))

# Salida final para Hyprlock
echo "$final_bar $pos_fmt / $len_fmt"
