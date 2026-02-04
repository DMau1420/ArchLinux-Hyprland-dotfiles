# Hola
## Antes de instalar
es necesario tener instalado hyprland, git y preferiblemente algun navegador como firefox
'''
sudo pacman -S git firefox
'''

![prueba2](./Wallpapers/desuwa.png)
![prueba3](./config/fastfetch/imagen/Iuno.gif)

## instalacion
### Automatica
'''
chmod +x install.sh
./install.sh
'''
Con el script install.sh Instalará automaticamente todas las dependecias y hara el movimiento de carpetas

### Manual
Mueve o copia cada carpeta de config del repositorio a .config, el archivo .zshrc y la carpeta Wallpapers lo vas a mover a tu carpeta /home/{user}
'''
mv config/* ~/.config/
mv .zshrc ~/
mv Wallpapers ~/
'''
