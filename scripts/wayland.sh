#!/bin/bash

# Name:Configuración de WayLand

message 'Desactivando Way Land en la configuración de GDM, espere ...'
run sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' ${GDM_CONF}
errors "Error al desactivar Way Land en la configuración de GDM"