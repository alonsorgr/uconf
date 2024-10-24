#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración del emulador de terminal

mkdir -p ~/.config
message "Creando enlace simbólico para la configuración del emulador de terminal sakura, espere ..."
run backup_and_link sakura .config
errors "Error al crear el enlace simbólico para la configuración del emulador de terminal sakura"

message "Creando enlace simbólico para la configuración de oh my zsh, espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de oh my zsh"

message "Instalando Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/warp-terminal 100
errors "Error al instalar Warp Terminal como predeterminado del sistema"

message "Estableciondo Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --set x-terminal-emulator /usr/bin/warp-terminal
errors "Error al establecer Warp Terminal como predeterminado del sistema"