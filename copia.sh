#!/bin/bash
destino=~/dotfiles/config

cp -r ~/.config/fastfetch $destino
cp -r ~/.config/hypr $destino
cp -r ~/.config/kitty $destino
cp -r ~/.config/rofi $destino
cp -r ~/.config/Scrips $destino
cp -r ~/.config/spicetify $destino
cp -r ~/.config/Thunar $destino
cp -r ~/.config/waybar $destino
cp -r ~/.config/waypaper $destino
cp -r ~/.config/quickshell $destino
cp -r ~/.config/cava $destino
cp -r ~/.config/swaync $destino
cp -r ~/.config/matugen $destino
cp -r ~/.config/wlogout $destino

cp -r ~/Wallpapers ~/dotfiles
cp ~/.zshrc ~/dotfiles

cp -r ~/.icons/* ~/dotfiles/icons
