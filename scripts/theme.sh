#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Tema GTK Plata

message "Eliminando versiones anteriores del tema GTK Plata, espere ..."
run sudo rm -rf /usr/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
errors "Error al eliminar las versiones anteriores del tema GTK Plata"

message "Configurando tema GTK plata, espere ..."
run "${__DIR__}/theme/plata-theme/autogen.sh --prefix=/usr" --with-selection_color=${SELECTION_COLOR} --with-accent_color=${ACCENT_COLOR} --with-suggestion_color=${SUGGESTION_COLOR}
errors "Error al configurar el tema GTK Plata"

message "Generando tema GTK plata configurado, espere ..."
run sudo make -C "${__DIR__}/theme/plata-theme"
errors "Error al generar el tema GTK Plata"

message "Instalando tema GTK plata generado, espere ..."
run sudo make install -C "${__DIR__}/theme/plata-theme"
errors "Error al instalar el tema GTK Plata"

message "Activando tema GTK plata generado, espere ..."
run gsettings set org.gnome.desktop.interface gtk-theme 'Plata-Noir'
errors "Error al activar el tema GTK Plata"

message "Generando tema GTK plata para pantalla de inicio de sesión, espere ..."
run sudo "${__DIR__}/scripts/gdm.sh"
errors "Error al generar el tema GTK plata de pantalla de inicio de sesión"

message "Activando tema GTK plata generado en pantalla de inicio de sesión, espere ..."
run gsettings set org.gnome.shell.extensions.user-theme name 'Plata-Noir'
errors "Error al activar el tema GTK plata en pantalla de inicio de sesión"

message "Estableciéndo el fondo de escritorio, espere ..."
run gsettings set org.gnome.desktop.background picture-uri 'file:///home/alonso/.uconf/config/background.jpg'
errors "Error al establecer el fondo de escritorio"

message "Estableciéndo el fondo de salva pantallas, espere ..."
run gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/alonso/.uconf/config/screensaver.jpg'
errors "Error al establecer el fondo de salva pantallas"
