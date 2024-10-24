#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración del emulador de terminal

message "Instalando Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/warp-terminal 100
errors "Error al instalar Warp Terminal como predeterminado del sistema"

message "Estableciondo Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --set x-terminal-emulator /usr/bin/warp-terminal
errors "Error al establecer Warp Terminal como predeterminado del sistema"

config_zsh()
{
    if [ ! -d ~/.oh-my-zsh ]; then
        message "Instalando Oh My ZSH..."
        run curl -L http://install.ohmyz.sh | sh
        errors "Error al descargar Oh My Zsh"
    else
        message "Oh My ZSH ya está instalado en el sistema"
    fi
    local DEST=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    if [ ! -d $DEST ]; then
        message "Instalando Zsh Syntax Highlighting..."
        run git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DEST
        errors "Error al descargar Zsh Syntax Highlighting"
    else
        message "Actualizando Zsh Syntax Highlighting, espere ..."
        (cd $DEST && git pull)
    fi
    DEST=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    if [ ! -d $DEST ]; then
        message "Instalando tema Powerlevel10k, espere ..."
        run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $DEST
        errors "Error al descargar el tema Powerlevel10k"
    else
        message "Actualizando tema Powerlevel10k, espere ..."
        (cd $DEST && run git pull)
    fi
    if grep $USER /etc/passwd | grep -vqs zsh; then
        message "Instalando Zsh al usuario actual, espere ..."
        run sudo chsh -s /bin/zsh $USER
    else
        message "Zsh ya asignado al usuario actual"
    fi
}

config_zsh

mkdir -p ~/.config
message "Creando enlace simbólico para la configuración del emulador de terminal sakura, espere ..."
run backup_and_link sakura .config
errors "Error al crear el enlace simbólico para la configuración del emulador de terminal sakura"

message "Creando enlace simbólico para la configuración de oh my zsh, espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de oh my zsh"