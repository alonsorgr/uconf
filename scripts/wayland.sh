#!/bin/bash

# Title:Configuración de WayLand

WAY_LAND_PATH='/etc/gdm3/custom.conf'

message 'Configuración de WayLand'
execute "sudo sed -i s/#WaylandEnable=false/WaylandEnable=false/ ${WAY_LAND_PATH}" "Activando WayLand, por favor, espere ..." "Error al activar WayLand"
success_message 'Configuración de WayLand terminada\n'