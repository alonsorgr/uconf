#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Instalación de tipografías

bar::start
for fonts in ${FONTS_LIST}; do
    message "Instalando tipografía ${fonts}, espere ..."
    run sudo cp -rf "${__DIR__}/fonts/${fonts}/*" "${HOME}/.local/share/fonts"
    errors "Error al instalar la tipografía ${fonts}"
    steps_done_fonts=$((${steps_done_fonts:-0}+1))
    bar::status_changed ${steps_done_fonts} ${FONTS_COUNT}
done
bar::stop

message "Restableciendo la caché de las tipografías del sistema, espere ..."
run fc-cache "${HOME}/.local/share/fonts"
errors "Error al restablecer la caché de las tipografías del sistema"