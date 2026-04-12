#!/bin/bash

# Enviar una notificación de inicio
notify-send "Limpieza" "Iniciando mantenimiento del sistema..." -i system-run-symbolic

# 1. Limpiar caché de Pacman (mantiene solo las últimas 2 versiones)
if command -v paccache &> /dev/null; then
    sudo paccache -rk2
fi

# 2. Eliminar paquetes huérfanos (no requeridos por otros)
orphans=$(pacman -Qtdq)
if [ -n "$orphans" ]; then
    sudo pacman -Rns $orphans --noconfirm
fi

# 3. Limpiar caché de Yay/Paru (si los usas)
if command -v yay &> /dev/null; then
    yay -Sc --noconfirm
fi

# 4. Limpiar logs de Journald (mayores a 2 días)
sudo journalctl --vacuum-time=2d

# Notificación final
notify-send "Limpieza" "Mantenimiento completado con éxito." -i checkbox-checked-symbolic
