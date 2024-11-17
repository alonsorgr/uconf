#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Tema Material Monokai Metallian

[ ! -d "${HOME}/.themes" ] && sudo mkdir -p "${HOME}/.themes"
[ ! -d "${HOME}/.config/gtk-4.0" ] && sudo mkdir -p "${HOME}/.config/gtk-4.0"
[ ! -d "/usr/share/themes" ] && sudo mkdir -p "/usr/share/themes"

message "Instalando tema GTK Material Monokai Metallian para el usuario actual, espere ..."
run unzip -o -q "${__DIR__}/theme/material-monokai-metallian-grey-dark.zip" -d "${HOME}/.themes"
errors "Error al instalar el tema GTK Material Monokai Metallian para el usuario actual"

message "Instalando tema GTK Material Monokai Metallian para todos los usuarios, espere ..."
run sudo unzip -o -q "${__DIR__}/theme/material-monokai-metallian-grey-dark.zip" -d "/usr/share/themes"
errors "Error al instalar el tema GTK Material Monokai Metallian para todos los usuarios"

message "Creando enlace simbólico de gtk.css para libadwaita, espere ..."
run ln -sf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0"
errors "Error al crear el enlace simbólico de gtk.css para libadwaita"

message "Creando enlace simbólico de gtk-dark.css para libadwaita, espere ..."
run ln -sf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0"
errors "Error al crear el enlace simbólico de gtk-dark.css para libadwaita"

message "Creando enlace simbólico de los assets para libadwaita, espere ..."
run ln -sf "${HOME}/.themes/Material-Monokai-Metallian-Grey-Dark/gtk-4.0/assets" "${HOME}/.config/gtk-4.0"
errors "Error al crear el enlace simbólico de los assets para libadwaita"

message "Activando modo oscuro, espere ..."
run gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
errors "Error al activar el modo oscuro"

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
run gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/${USER}/.uconf/config/background.jpg"
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

message "Instalando tema para Gnome Text Editor, espere ..."
run sudo cp -rf "${__DIR__}/config/material-monokai-metallian.xml" "/usr/share/gnome-text-editor/styles/material-monokai-metallian.xml"
errors "Error al instalar el tema para Gnome Text Editor"