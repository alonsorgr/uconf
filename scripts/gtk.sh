#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración personal de GTK

[ ! -d "$HOME/.config/gtk-3.0/" ] && mkdir -p ${GTK_CONFIG}
[ ! -f ${GTK_CONFIG} ] && touch ${GTK_CONFIG}


if [ $(grep  'window.ssd' ${GTK_CONFIG} | wc -l) -eq 0 ]; then
    message "Instalando configuración de tamaño de barra de título GTK, espere ..."
    run curl -sL ${GTK_HEADERBAR_URL} >> ${GTK_CONFIG}
    errors "Error al instalar configuración de tamaño de barra de título GTK"
else
    echo -e "Configuración de tamaño de barra de título GTK ya instalada"
fi
