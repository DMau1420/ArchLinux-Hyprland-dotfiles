#!/bin/bash
#Instalacion de Dependencias

if ! comand -v yay &> /dev/null; then
  sudo pacman -S --needed base-devel git -y
  git clone https://aur.archlinux.org/yay.git -y /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
  cd
fi

sudo pacman -S --needed --noconfirm swww fastfetch blueman bluez bluez-utils brightnessctl eza hyprshot kitty loupe networkmanager network-manager-applet nwg-look neovim pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse rofi sddm sddm-kcm spotify-launcher thunar thunar-archive-plugin tree nerd-fonts ufw waybar yazi zsh

#instalacion otras dependencias
yay -S --noconfirm eww flat-remix-gtk spicetify-cli sddm-silent-theme

#instalacion de oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh"]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p ~/Wallpapers

#instalacion de los dotfiles
cp -rv config/* ~/.config/
cp .zshrc ~/
cp -rv Wallpapers/* ~/Wallpapers/

read -p "Quieres Reiniciar ahora? (y/n)" confirm
if [[ $confirm == [yY] ]]; then
  sudo reboot
fi
