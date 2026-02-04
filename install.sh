#!/bin/bash
#Instalacion de Dependencias
sudo pacman -S swww fastfetch blueman bluez bluez-utils brightnessctl eza hyprshot kitty loupe networkmanager network-manager-applet nwg-look neovim pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse rofi sddm sddm-kcm spotify-launcher thunar thunar-archive-plugin tree nerd-fonts ufw waybar yazi

#instalacion de oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#instalacion otras dependencias
yay -S eww flat-remix-gtk spicetify-cli sddm-silent-theme


#instalacion de los dotfiles
cp config/* ~/.config/
cp .zshrc ~/
cp Wallpapers ~/
