#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Extensiones de entorno de esctritorio Gnome

message 'Eliminando extensión Ubuntu Dock, espere ...'
run sudo apt remove gnome-shell-extension-ubuntu-dock
errors "Error al eliminar extensión Ubuntu Dock"

bar::start
for extension in ${GNOME_EXTENSIONS_LIST}; do
    uuid=$(echo "${GNOME_EXTENSIONS_BASEURL}${extension}" | sed -E 's|.*extensions/(.*)/versions.*|\1|')
    message "Descargando la extensión ${uuid}, espere ..."
    run wget -O "${uuid}.zip" "${GNOME_EXTENSIONS_BASEURL}${extension}"
    errors "Error al descargar la extensión ${uuid}"
    message "Descomprimiendo la extensión ${uuid}, espere ..."
    mkdir -p "${GNOME_EXTENSIONS_BASEPATH}${uuid}"
    run unzip -o "${uuid}.zip" -d "${GNOME_EXTENSIONS_BASEPATH}${uuid}"
    errors "Error al descomprimir la extensión ${uuid}"
    message "Activando la extensión ${uuid}, espere ..."
    run gnome-extensions enable ${uuid}
    errors "Error al activar la extensión ${uuid}"
    message "Eliminando paquete de instalación ${uuid}"
    run rm -rf "${uuid}.zip"
    errors "Error al eliminar el paquete de instalación ${extension}"
    steps_done_extension=$((${steps_done_extension:-0}+1))
    bar::status_changed ${steps_done_extension} ${GNOME_EXTENSIONS_COUNT}
done
bar::stop