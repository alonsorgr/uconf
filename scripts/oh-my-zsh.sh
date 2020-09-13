#!/bin/bash

# Name:Instalación de configuración de zsh Oh My ZSH

OH_MY_ZSH_URL='http://install.ohmyz.sh'
ZSH_SYNTAX_HIGHLIGHTING_URL='https://github.com/zsh-users/zsh-syntax-highlighting.git'
POWERLEVEL10K_URL='https://github.com/romkatv/powerlevel10k.git'
EXA_URL='https://github.com/ricpelo/exa/releases/download/iconos/exa.bz2'

message 'Instalación de configuración de zsh Oh My ZSH'

if [ ! -d ~/.oh-my-zsh ]; then
    echo -e "Instalando Oh My ZSH, espere ..."
    [ "${verbose}" == "--verbose" ] && curl -sL ${OH_MY_ZSH_URL} | sh || curl -sL ${OH_MY_ZSH_URL} | sh &> ${NULL}
    check_errors "Error al instalar Oh My ZSH"
else
    echo -e "Oh My ZSH ya instalado"
fi
local dst=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ ! -d ${dst} ]; then
    echo -e "Instalando Zsh Syntax Highlighting, espere ..."
    [ "${verbose}" == "--verbose" ] &&  git clone ${ZSH_SYNTAX_HIGHLIGHTING_URL} ${dst} ||  git clone ${ZSH_SYNTAX_HIGHLIGHTING_URL} ${dst} | sh &> ${NULL}
    check_errors "Error al instalar Syntax Highlighting"
else
    echo -e "Actualizando Zsh Syntax Highlighting, espere ..."
    (cd ${dst} && [ "${verbose}" == "--verbose" ] && git pull || git pull &> ${NULL})
    check_errors "Error al actualizar Syntax Highlighting"
fi
dst=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d ${dst} ]; then
    echo -e "Instalando tema Powerlevel10k, espere ..."
    [ "${verbose}" == "--verbose" ] && git clone --depth=1 ${POWERLEVEL10K_URL} ${dst} || git clone --depth=1 ${POWERLEVEL10K_URL} ${dst} &> ${NULL}
    check_errors "Error al instalar Powerlevel10k"
else
    echo -e "Actualizando tema Powerlevel10k, espere ..."
    (cd ${dst} && [ "${verbose}" == "--verbose" ] && git pull || git pull &> ${NULL})
    check_errors "Error al actualizar Powerlevel10k"
fi
if grep $USER '/etc/passwd' | grep -vqs zsh; then
    echo -e "Instalando Oh My ZSH al usuario actual, espere ..."
    [ "${verbose}" == "--verbose" ] && sudo chsh -s '/bin/zsh' $USER || sudo chsh -s '/bin/zsh' $USER &> ${NULL}
    check_errors "Error al instalar Oh My ZSH"
else
    echo -e "Zsh ya asignado al usuario actual"
fi
dst="$HOME/.local/bin/exa"
if [ ! -f ${dst} ]; then
    echo -e "Instalando listador de archivos exa, espere ..."
    [ "${verbose}" == "--verbose" ] && curl -sL ${EXA_URL} | bunzip2 -d > ${dst} && chmod a+x ${dst} || curl -sL ${EXA_URL} | bunzip2 -d > ${dst} && chmod a+x ${dst} &> ${NULL}
    check_errors "Error al instalar listador de archivos exa"
else
    echo -e "Listador de archivos exa ya instalado"
fi

backup_and_link '.zshrc'

success_message 'Instalación de configuración de zsh Oh My ZSH\n'