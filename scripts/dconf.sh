#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Importación de configuración de Gnome

message "Importando configuración de Gnome, espere ..."
run dconf load / < "${__DIR__}/config/gnome-config.cfg"
errors "Error al importar la configuración de Gnome"
