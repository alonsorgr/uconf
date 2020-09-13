#!/bin/bash

# Name:Tipografías de programador

SRC_FONTS="${BASE_DIR}/fonts"
DST_FONTS="$HOME/.local/share/fonts"
FONTS_LIST=$(cat ${BASE_DIR}/config/fonts.cfg)

message 'Intsalación de Tipografías'

mkdir -p ${DST_FONTS}

for font in ${FONTS_LIST}; do
    execute "cp -rf ${SRC_FONTS}/$f/* ${FONTS_DIR}" "Instalándo tipografía ${font}, espere ..." "Error al instalar la tipografía ${font}"
done

execute "fc-cache -f ${FONTS_DIR}" "Actualizando caché de tipografías del sistema, espere ..."

execute "${SRC_FONTS}/powerline-fonts/install.sh" "Instalándo tipografías Powerline Fonts, espere ..." "Error al instalar la tipografía Powerline Fonts"

success_message 'Instalación de tipografías terminada\n'