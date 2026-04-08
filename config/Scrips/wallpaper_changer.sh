#!/bin/bash

while true; do 
	waypaper --random

	sleep 0.5
	wallpaper_act=$(awww query | awk '{print $NF}')
	cp "$wallpaper_act" /tmp/wallpaper_actual
	matugen image "$wallpaper_act" --prefer saturation -t scheme-vibrant
	swaync-client -rs
	sleep 300
done
