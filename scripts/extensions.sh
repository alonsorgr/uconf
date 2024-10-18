#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Extensiones de entorno de esctritorio GNOME

function install() {
# Lista de UUIDs de las extensiones
array=( color-picker@tuberry
dash-to-panel@jderose9.github.com
EasyScreenCast@iacopodeenosee.gmail.com
quick-settings-tweaks@qwreey
quick-settings-avatar@d-go )

for i in "${array[@]}"
do
    # Realizar búsqueda de la extensión en la API
    SEARCH_RESULT=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${i}" | jq '.extensions[] | select(.uuid == "'${i}'")')

    # Verificar si la extensión fue encontrada
    if [ -z "$SEARCH_RESULT" ]; then
        echo "No se pudo obtener la información de la extensión $i"
        continue
    fi

    EXTENSION_ID=$(echo "$SEARCH_RESULT" | jq -r '.uuid')

    # Obtener la última versión disponible de la extensión (sin importar la versión de GNOME)
    VERSION_TAG=$(echo "$SEARCH_RESULT" | jq '.shell_version_map | map(.pk) | max')

    # Verificar si se encontró un version_tag
    if [ -z "$VERSION_TAG" ]; then
        echo "No se pudo obtener el version_tag para la extensión $i"
        continue
    fi

    # Descargar la extensión
    wget -O "${EXTENSION_ID}.zip" "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    
    # Verificar si el archivo ZIP se descargó correctamente
    if [ ! -f "${EXTENSION_ID}.zip" ] || [ ! -s "${EXTENSION_ID}.zip" ]; then
        echo "La descarga de la extensión $EXTENSION_ID falló."
        continue
    fi

    # Instalar la extensión
    gnome-extensions install --force "${EXTENSION_ID}.zip"

    # Verificar si la extensión se instaló correctamente
    if ! gnome-extensions list | grep --quiet "${EXTENSION_ID}"; then
        echo "La instalación de la extensión $EXTENSION_ID falló."
        continue
    fi

    # Activar la extensión
    gnome-extensions enable "${EXTENSION_ID}"

    # Verificar si la extensión se activó correctamente
    if gnome-extensions info "${EXTENSION_ID}" | grep --quiet "disabled"; then
        echo "La activación de la extensión $EXTENSION_ID falló."
        continue
    fi

    # Eliminar el archivo ZIP descargado
    rm "${EXTENSION_ID}.zip"

    echo "Extensión $EXTENSION_ID instalada y activada con éxito."
done
}

install

