#!/bin/bash

function install_icons() {
    message 'Configuración de iconos del sistema'
    echo -e 'Configurando iconos del sistema a Papirus-Dark, por favor, espere ...'
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' &> ${NULL}
    echo -e 'Configurando color de iconos de directorios a Papirus-Dark, por favor, espere ...'
    papirus-folders -C white --theme Papirus-Dark &> ${NULL}
    success_message 'Instalación de tema de iconos terminada'
}