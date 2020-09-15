#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración de WayLand

message 'Desactivando Way Land en la configuración de GDM, espere ...'
run sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' ${GDM_CONF}
errors "Error al desactivar Way Land en la configuración de GDM"