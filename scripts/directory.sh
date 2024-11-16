#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración de directorios del usuario

message "Creando directorio Repositorios en el directorio personal, espere ..."
if [ ! -d "${HOME}/Repositorios" ]; then
    mkdir "${HOME}/Repositorios"
    run gio set "${HOME}/Repositorios" metadata::custom-icon 'file:///usr/share/icons/Papirus/64x64/places/folder-white-github.svg'
    errors "Error al crear el directorio Web en el directorio personal"
fi

message "Configurando accesos directos, espere ..."
if [ -f "/usr/share/applications/io.github.celluloid_player.Celluloid.desktop" ]; then
    sudo sed -i 's/Name\[es\]=Celuloide/Name\[es\]=Vídeos/g' "/usr/share/applications/io.github.celluloid_player.Celluloid.desktop"
fi
if [ -f "/usr/share/applications/org.gnome.Rhythmbox3.desktop" ]; then
    sudo sed -i 's/Name=Rhythmbox/Name=Música/g' "/usr/share/applications/org.gnome.Rhythmbox3.desktop"
fi
if [ -f "/usr/share/applications/org.gnome.Rhythmbox3.device.desktop" ]; then
    sudo sed -i 's/Name=Rhythmbox/Name=Música/g' "/usr/share/applications/org.gnome.Rhythmbox3.device.desktop"
fi
if [ -f "/usr/share/applications/easytag.desktop" ]; then
    sudo sed -i 's/Name\[es\]=EasyTAG/Name\[es\]=MP3 Tag/g' "/usr/share/applications/easytag.desktop"
fi
