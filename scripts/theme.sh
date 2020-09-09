#!/bin/bash

message 'Intsalación de tema GTK Plata'
call_command "sudo rm -rf /usr/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}" "Eliminando versiones anteriores del tema GTK Plata, por favor, espere ..." "Error al eliminar versiones anteriores del tema GTK Plata"
call_command "${BASE_DIR}/theme/plata-theme/autogen.sh --prefix=/usr --with-selection_color=#bfbfbf --with-accent_color=#ffffff --with-suggestion_color=#cccccc" "Configurando colores del tema GTK, por favor, espere ..." "Error al configurar colores del tema GTK"
call_command "make -C ${BASE_DIR}/theme/plata-theme" "Generando tema GTK con la configuración de los colores configurados, por favor, espere ..." "Error al generar tema GTK con la configuración de los colores configurados"
call_command "sudo make install -C ${BASE_DIR}/theme/plata-theme" "Instalando tema GTK con la configuración de los colores configurados, por favor, espere ..." "Error al instalar tema GTK con la configuración de los colores configurados"
call_command "gsettings set org.gnome.shell.extensions.user-theme name 'Plata-Noir'" "Activando tema GDM Plata, por favor, espere ..." "Error al activar tema GDM Plata"
call_command "gsettings set org.gnome.desktop.interface gtk-theme 'Plata-Noir'" "Activando tema GTK Plata, por favor, espere ..." "Error al activar tema GTK Plata"
call_command "sudo ${BASE_DIR}/scripts/gdm.sh" "Configurando el fondo de pantalla de inicio de sesión, por favor, espere ..." "Error al configurar el fondo de pantalla de inicio de sesión"
success_message 'Instalación de tema GTK Plata terminada\n'
