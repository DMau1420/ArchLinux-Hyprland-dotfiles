#!/bin/bash
#Instalacion de oh-my-zsh
sudo pacman -S swww fastfetch blueman bluez bluez-utils eza hyprshot kitty loupe networkmanager network-manager-applet nwg-look neovim pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse rofi sddm sddm-kcm spotify-launcher thunar thunar-archive-plugin tree nerd-fonts ufw waybar yazi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S eww flat-remix-gtk spicetify-cli sddm-silent-theme 
