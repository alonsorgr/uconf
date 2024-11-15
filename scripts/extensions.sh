#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Extensiones de entorno de esctritorio Gnome

message 'Eliminando extensión Ubuntu Dock, espere ...'
run sudo apt remove -y gnome-shell-extension-ubuntu-dock
errors "Error al eliminar extensión Ubuntu Dock"

bar::start
for extension in ${GNOME_EXTENSIONS_LIST}; do
    message "Descargando la extensión ${extension}, espere ..."
    run gext install ${extension}
    errors "Error al descargar la extensión ${extension}"
    message "Activando la extensión ${extension}, espere ..."
    run gext enable ${extension}
    errors "Error al activar la extensión ${extension}"
    steps_done_extension=$((${steps_done_extension:-0}+1))
    bar::status_changed ${steps_done_extension} ${GNOME_EXTENSIONS_COUNT}
done
bar::stop
gnome-extensions-cli