#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración del emulador de terminal

mkdir -p ~/.config
message "Creando enlace simbólico para la configuración del emulador de terminal sakura, por favor espere ..."
run backup_and_link sakura .config
errors "Error al crear el enlace simbólico para la configuración del emulador de terminal sakura"

message "Creando enlace simbólico para la configuración de oh my zsh, por favor espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de oh my zsh"

message "Estableciondo Warp Terminal como termninal predeterminado, por favor espere ..."
run sudo update-alternatives --quiet --set x-terminal-emulator /usr/bin/warp-terminal
errors "Error al establecer Warp Terminal como predeterminado del sistema"