#!/bin/bash
sleep 0.5

wallpaper_act=$(awww query | awk '{print $NF}')

if [ -n "$wallpaper_act" ]; then
	cp "$wallpaper_act" /tmp/wallpaper_actual
	matugen image "$wallpaper_act" --prefer saturation -t scheme-vibrant
	swaync -rs
	notify-send "Wallpaper cambiado" 
fi
