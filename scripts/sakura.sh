#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración del emulador de terminal Sakura

mkdir -p ~/.config
message "Creando enlace simbólico para la configuración del emulador de terminal sakura, espere ..."
run backup_and_link sakura .config
errors "Error al crear el enlace simbólico para la configuración del emulador de terminal sakura"

message "Creando enlace simbólico para la configuración de oh my zsh, espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de oh my zsh"
