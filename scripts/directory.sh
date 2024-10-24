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
