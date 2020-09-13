#!/bin/bash

# Name:Importación de configuración de GNOME

DIR=${BASE_DIR}/config/gnome.cfg

message 'Importación de configuración de GNOME'
execute "$(dconf load / < ${DIR})" "Importando la configuración de GNOME, espere ..." "Error al configurar GNOME"
success_message 'Configuración de GNOME terminada\n'