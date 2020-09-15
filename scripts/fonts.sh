#!/bin/bash

# Name:Tipografías

if [ ! -d "${DST_FONTS}" ]; then
    message "Creando el directorio para la instalación de las tipografías, espere ..."
    run mkdir -p ${DST_FONTS}
    errors "Error al crear el directorio para la instalación de las tipografías"
fi

for font in ${FONTS_LIST}; do
    message "Instalándo tipografía ${font}, espere ..."
    run cp -rf ${SRC_FONTS}/* ${FONTS_DIR}
    errors "Error al instalar la tipografía ${font}"
done

message "Actualizando caché de tipografías del sistema, espere ..."
run fc-cache -f ${FONTS_DIR}
errors "Error al actualizar la caché de tipografías del sistema"

message "Instalándo tipografías Powerline Fonts, espere ..."
run ${SRC_FONTS}/powerline-fonts/install.sh
errors "Error al instalar la tipografía Powerline Fonts"
