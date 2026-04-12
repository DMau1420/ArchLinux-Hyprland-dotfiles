#!/bin/bash

# Notificación de inicio
notify-send "Actualización" "Buscando actualizaciones disponibles..." -i system-software-update

# Lanzar la terminal para realizar la actualización
# Nota: Ajusta 'kitty' por tu terminal favorita (alacritty, foot, etc.)
kitty --title "Actualización del Sistema" sh -c "sudo pacma -Syu && yay -Syu"

# Notificación al cerrar la terminal
notify-send "Actualización" "Proceso de actualización terminado." -i checkbox-checked-symbolic
