#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Extensiones de entorno de esctritorio GNOME

function install() {
    for i in "${GNOME_EXTENSIONS_LIST[@]}"; do
        EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
        VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
        wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG" &> ${NULL}
        gnome-extensions install --force ${EXTENSION_ID}.zip &> ${NULL}
        if ! gnome-extensions list | grep --quiet ${EXTENSION_ID} &> ${NULL}; then
            busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID} &> ${NULL}
        fi
        gnome-extensions enable ${EXTENSION_ID} &> ${NULL}
        rm ${EXTENSION_ID}.zip &> ${NULL}
    done
}

install

