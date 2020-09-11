#!/bin/bash

# Name:Parirus Icon Theme

message 'Configuración de paquete de iconos Papirus'
execute "gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'" "Configurando paquete de iconos Papirus, por favor, espere ..." "Error configurar el paquete de iconos Papirus"
execute "papirus-folders -C white --theme Papirus-Dark" "Configurando paquete de iconos Papirus Folders, por favor, espere ..." "Error configurar el paquete de iconos Papirus Folders"
success_message 'Instalación de tema de iconos terminada\n'