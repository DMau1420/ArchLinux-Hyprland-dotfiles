#!/bin/bash

if eww active-windows | grep -q "calendario"; then
    eww close calendario
else
    # Inicializamos las variables con la fecha de hoy antes de abrir
    eww update current_month=$(date +%m)
    eww update current_year=$(date +%Y)
    eww open calendario
fi
