#!/bin/bash

# Name:Configuración personal de GTK

GTK_CONFIG="$HOME/.config/gtk-3.0/gtk.css"
GTK_HEADERBAR_URL='https://gist.githubusercontent.com/alonsorgr/3f6a63bb39bc092f16894f3fabb1bc86/raw/c4fabdcadf39918c11d25ab2ede79251ff06a879/gtk.css'

message 'Configuración personal de GTK'

[ ! -d "$HOME/.config/gtk-3.0/" ] && mkdir -p ${GTK_CONFIG}
[ ! -f ${GTK_CONFIG} ] && touch ${GTK_CONFIG}

if [ $(grep  'window.ssd' ${GTK_CONFIG} | wc -l) -eq 0 ]; then
    echo -e "Instalando configuración de tamaño de barra de título GTK, espere ..."
    [ "${verbose}" == "--verbose" ] && curl -sL ${GTK_HEADERBAR_URL} >> ${GTK_CONFIG} || curl -sL ${GTK_HEADERBAR_URL} >> ${GTK_CONFIG} &> ${NULL}
    check_errors "Error al instalar configuración de tamaño de barra de título GTK"
else
    echo -e "Configuración de tamaño de barra de título GTK ya instalada"
fi

success_message 'Configuración personal de GTK terminada\n'