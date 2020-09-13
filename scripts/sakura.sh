#!/bin/bash

# Name:Configuración del emulador de terminal Sakura

DIR="${BASE_DIR}/config/sakura.conf"
CONFIG="$HOME/.config/sakura"
SAKURA="/usr/bin/sakura"

message 'Configuración del emulador de terminal Sakura'

mkdir -p ${CONFIG}
execute "ln -sf $(realpath ${DIR}) ${CONFIG}/sakura.conf" "Creando enlace simbólico para la configuración de Sakura, espere ..." "Error al crear el enlace simbólico de Sakura"
execute "sudo update-alternatives --quiet --set x-terminal-emulator ${SAKURA}" "Estableciendo Sakura como terminal predeterminado, espere ..." "Error al establecer a Sakura como terminal predeterminado"

success_message 'Configuración del emulador de terminal Sakura\n'