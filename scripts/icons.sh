#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Parirus Icon Theme

message 'Configurando el paquete de iconos Papirus, espere ...'
run gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
errors "Error al configurar el paquete de iconos Papirus"

message 'Configurando el paquete de iconos Papirus Folders, espere ...'
run papirus-folders -C white --theme 'Papirus-Dark'
errors "Error configurar el paquete de iconos Papirus Folders"
