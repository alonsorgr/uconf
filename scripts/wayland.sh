#!/bin/bash

# Name:Configuración de WayLand

GDM_CONF='/etc/gdm3/custom.conf'

message 'Configuración de WayLand'
execute "sudo sed -i s/#WaylandEnable=false/WaylandEnable=false/ ${GDM_CONF}" "Desactivando WayLand, espere ..." "Error al desactivar WayLand"
success_message 'Configuración de WayLand terminada\n'