#!/bin/bash

# Name:Instalación de configuración de zsh Oh My ZSH

OH_MY_ZSH_URL='http://install.ohmyz.sh'
ZSH_SYNTAX_HIGHLIGHTING_URL='https://github.com/zsh-users/zsh-syntax-highlighting.git'
POWERLEVEL10K_URL='https://github.com/romkatv/powerlevel10k.git'
EXA_URL='https://github.com/ricpelo/exa/releases/download/iconos/exa.bz2'

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    message "Instalando Oh My ZSH, espere ..."
    run curl -sL ${OH_MY_ZSH_URL} | sh
    errors "Error al instalar Oh My ZSH"
else
    message "Oh My ZSH ya instalado ..."
fi
local dst=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ ! -d ${dst} ]; then
    message "Instalando Zsh Syntax Highlighting, espere ..."
    run git clone ${ZSH_SYNTAX_HIGHLIGHTING_URL} ${dst}
    errors "Error al instalar Syntax Highlighting"
else
    message "Actualizando Zsh Syntax Highlighting, espere ..."
    (cd "${dst}" && run git pull)
    errors "Error al actualizar Syntax Highlighting"
fi
dst=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d ${dst} ]; then
    message "Instalando tema Powerlevel10k, espere ..."
    run git clone --depth=1 ${POWERLEVEL10K_URL} ${dst}
    errors "Error al instalar Powerlevel10k"
else
    message "Actualizando tema Powerlevel10k, espere ..."
    (cd "${dst}" && run git pull)
    errors "Error al actualizar Powerlevel10k"
fi
if grep ${USER} '/etc/passwd' | grep -vqs zsh; then
    message "Instalando Oh My ZSH al usuario actual, espere ..."
    run sudo chsh -s '/bin/zsh' $USER
    errors "Error al instalar Oh My ZSH"
else
    message "Zsh ya asignado al usuario actual ..."
fi
[ ! -d "${HOME}/.local/bin/" ] && mkdir "${HOME}/.local/bin/"
dst="${HOME}/.local/bin/exa"
if [ ! -f ${dst} ]; then
    message "Instalando listador de archivos exa, espere ..."
    run curl -sL ${EXA_URL} | bunzip2 -d > ${dst} && chmod a+x ${dst}
    errors "Error al instalar listador de archivos exa"
else
    message "Listador de archivos exa ya instalado ..."
fi

message "Creando enlace simbólico para la configuración de zsh Oh My ZSH, espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de zsh Oh My ZSH"
