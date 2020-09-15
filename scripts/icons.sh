#!/bin/bash

# Name:Parirus Icon Theme

message 'Configurando el paquete de iconos Papirus, espere ...'
run gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
errors "Error al configurar el paquete de iconos Papirus"

message 'Configurando el paquete de iconos Papirus Folders, espere ...'
run papirus-folders -C white --theme 'Papirus-Dark'
errors "Error configurar el paquete de iconos Papirus Folders"
