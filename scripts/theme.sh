#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Tema Material Monokai Metallian

if [ ! -d "/root/.themes" ]; then
    sudo mkdir -p "/root/.themes"
fi

if [ ! -d "/usr/share/themes" ]; then
    sudo mkdir -p "/usr/share/themes"
fi

message "Configurando e instalando tema GTK Material Monokai Metallian, espere ..."
run "${__DIR__}/theme/material-monokai-metallian/install.sh -n Material-Monokai-Metallian -t grey -c dark -l --size standard --tweaks submenu primary solid"
errors "Error al configurar el tema GTK Plata"

message "Instalando tema GTK Material Monokai Metallian para todos los usuarios, espere ..."
run sudo cp -rf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark" "/usr/share/themes" 
errors "Error al instalar tema GTK Material Monokai Metallian para todos los usuarios"

message "Instalando tema GTK Material Monokai Metallian para root, espere ..."
run sudo cp -rf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark" "/root/.themes" 
errors "Error al instalar tema GTK Material Monokai Metallian para root"

message "Creando enlace Libadwaita para tema GTK Material Monokai Metallian para root, espere ..."
run sudo cp -rf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark/gtk-4.0" "/root/.config" 
errors "Error al crear el enlace Libadwaita para tema GTK Material Monokai Metallian para root"

message "Activando tema GTK Material-Monokai-Metallian generado, espere ..."
run gsettings set org.gnome.desktop.interface gtk-theme 'Material-Monokai-Metallian-Grey-Dark'
errors "Error al activar el tema GTK Material-Monokai-Metallian"

message "Activando tema GTK Material-Monokai-Metallian generado en pantalla de inicio de sesión, espere ..."
run gsettings set org.gnome.shell.extensions.user-theme name 'Material-Monokai-Metallian-Grey-Dark'
errors "Error al activar el tema GTK Material-Monokai-Metallian en pantalla de inicio de sesión"

message 'Configurando el paquete de iconos Papirus, espere ...'
run gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
errors "Error al configurar el paquete de iconos Papirus"

message 'Configurando el paquete de iconos Papirus Folders, espere ...'
run papirus-folders -C white --theme 'Papirus-Dark'
errors "Error configurar el paquete de iconos Papirus Folders"

message "Estableciéndo configuración del logo de la pantalla de inicio de sesión, espere ..."
run sudo cp -rf "${__DIR__}/config/ubuntu-logo.png" "/usr/share/plymouth/ubuntu-logo.png"
errors "Error al establecer la configuración del logo de la pantalla de inicio de sesión"

message "Estableciéndo el fondo de escritorio, espere ..."
run gsettings set org.gnome.desktop.background picture-uri "file:///home/${USER}/.uconf/config/background.jpg"
errors "Error al establecer el fondo de escritorio"

message "Estableciéndo el fondo de salva pantallas, espere ..."
run gsettings set org.gnome.desktop.screensaver picture-uri "file:///home/${USER}/.uconf/config/screensaver.jpg"
errors "Error al establecer el fondo de salva pantallas"

message "Estableciéndo configuración de Plymouth, espere ..."
run sudo cp -rf "${__DIR__}/config/watermark.png" "/usr/share/plymouth/themes/spinner/watermark.png"
errors "Error al establecer la configuración de Plymouth"

message "Estableciéndo configuración del logo de Plymouth, espere ..."
run sudo cp -rf "${__DIR__}/config/ubuntu-logo.png" "/usr/share/plymouth/themes/spinner/bgrt-fallback.png"
errors "Error al establecer la configuración del logo de Plymouth"