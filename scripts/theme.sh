#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

function install_theme() {
    message 'Intsalación de tema GTK Plata'

    echo -e 'Eliminando versiones anteriores del tema GTK Plata, por favor, espere ...'
    sudo rm -rf /usr/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact} &> ${NULL}

    echo -e 'Configurando colores del tema GTK, por favor, espere ...'
    ${BASE_DIR}/theme/plata-theme/autogen.sh --prefix=/usr --with-selection_color='#bfbfbf' --with-accent_color='#ffffff' --with-suggestion_color='#cccccc' &> ${NULL}
    check_errors 'Error en la configuración de colores del tema GTK\n'

    echo -e 'Generando tema GTK con la configuración de los colores configurados, por favor, espere ...'
    cd ${BASE_DIR}/theme/plata-theme/
    make &> ${NULL}
    check_errors 'Error en la generación de tema GTK con la configuración de los colores\n'

    echo -e 'Instalando tema GTK con la configuración de los colores configurados, por favor, espere ...'
    sudo make install &> ${NULL}
    cd ${BASE_DIR}
    check_errors 'Error en la instalación de tema GTK con la configuración de los colores\n'

    echo -e 'Activando gnome extension user-theme, por favor, espere ...'
    gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

    echo -e 'Activando tema GDM Plata, por favor, espere ...'
    gsettings set org.gnome.shell.extensions.user-theme name "Plata-Noir" &> ${NULL}
    echo -e 'Activando tema GTK Plata, por favor, espere ...'
    gsettings set org.gnome.desktop.interface gtk-theme "Plata-Noir" &> ${NULL}

    echo -e 'Configurando el fondo de pantalla de inicio de sesión, por favor, espere ...'
    sudo ${BASE_DIR}/scripts/gdm.sh

    success_message 'Instalación de tema GTK Plata terminada'
}