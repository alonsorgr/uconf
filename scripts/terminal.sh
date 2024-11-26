#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración del emulador de terminal

message "Estableciendo Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/warp-terminal 100
errors "Error al establecer Warp Terminal como predeterminado del sistema"

message "Estableciondo Warp Terminal como termninal predeterminado, espere ..."
run sudo update-alternatives --quiet --set x-terminal-emulator /usr/bin/warp-terminal
errors "Error al establecer Warp Terminal como predeterminado del sistema"

message "Estableciendo la shell Zsh por defecto para el usuario actual, espere ..."
run sudo chsh -s /bin/zsh $USER
errors "Error al establecer la shell Zsh por defecto para el usuario actual"

message "Instalando Oh My Zsh en el sistema para el usuario actual, espere ..."
run curl -L http://install.ohmyz.sh | sh
errors "Error al instalar Oh My Zsh en el sistema para el usuario actual"

message "Instalando tema Powerlevel10k para Oh My Zsh en el sistema para el usuario actual, espere ..."
run git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k
errors "Error al instalar tema Powerlevel10k para Oh My Zsh en el sistema para el usuario actual"

message "Instalando zsh Syntax Highlighting, espere ..."
run git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
errors "Error al instalar zsh Syntax Highlighting"

message "Instalando zsh-bat, espere ..."
run git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-bat
errors "Error al instalar zsh-bat"

[ ! -d "${HOME}/.config" ] && mkdir -p "${HOME}/.config"
[ ! -d "${HOME}/.local/share/warp-terminal/themes" ] && mkdir -p "${HOME}/.local/share/warp-terminal/themes"
[ ! -d "${HOME}/.local/bin" ] && mkdir -p "${HOME}/.local/bin"

message "Creando enlace simbólico para la configuración de oh my zsh, espere ..."
run backup_and_link .zshrc
errors "Error al crear el enlace simbólico para la configuración de oh my zsh"

message "Creando enlace simbólico para la configuración de lsd, espere ..."
run backup_and_link lsd .config
errors "Error al crear el enlace simbólico para la configuración de lsd"

message "Creando enlace simbólico para la configuración de dircolors, espere ..."
run backup_and_link .dircolors
errors "Error al crear el enlace simbólico para la configuración de dircolors"

message "Creando enlace simbólico para la configuración de Warp Terminal, espere ..."
run backup_and_link warp-terminal .config
errors "Error al crear el enlace simbólico para la configuración de Warp Terminal"

message "Creando enlace simbólico para el tema Material Monokai Metallian de Warp Terminal, espere ..."
run backup_and_link material-monokai-metallian.yaml .local/share/warp-terminal/themes
errors "Error al crear el enlace simbólico para el tema Material Monokai Metallian de Warp Terminal"

message "Creando ejecutable para bat, espere ..."
run ln -s /usr/bin/batcat ${HOME}/.local/bin/bat
errors "Error al crear el ejecutable para bat"