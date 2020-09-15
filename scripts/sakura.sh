#!/bin/bash

# Name:Configuración del emulador de terminal Sakura
mkdir -p ~/.config
message "Creando enlace simbólico para la configuración del emulador de terminal sakura, espere ..."
run backup_and_link sakura .config
errors "Error al crear el enlace simbólico para la configuración del emulador de terminal sakura"

message "Estableciendo como emulador de terminal a sakura, espere ..."
run sudo update-alternatives --quiet --set x-terminal-emulator ${SAKURA_BIN_PATH}
errors "Error al establecer como emulador de terminal a sakura"

message "Creando enlace simbólico para la configuración de dircolors del emulador de terminal sakura, espere ..."
backup_and_link .dircolors
errors "Error al crear el enlace simbólico para la configuración de dircolors del emulador de terminal sakura"
