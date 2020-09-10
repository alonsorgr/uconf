#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

echo -e 'Inicializando, por favor, espere ...'

source ${BASE_DIR}/lib/params.sh
source ${BASE_DIR}/lib/helper.sh $2

message "\nConfiguración personal de Ubuntu ${OS_VERSION}\n"

execute "sudo apt install curl -y" "Instalando dependencia $(package_info "curl"), por favor, espere ..." "Error al instalar la dependencia $(package_info "curl")"
success_message "Intslación de dependencia $(package_info "curl") terminada\n"

source ${BASE_DIR}/lib/sources.sh

SCRIPTS='packages drivers gnome-extensions theme icons wayland'

module_update
success_message 'Actualización de módulos terminada\n'

[ "$1" == '-y' ] && quiet='-y' || quiet=''

for script in ${SCRIPTS}; do
    question "source $BASE_DIR/scripts/${script}.sh" "¿Desea ejecutar el script $(get_title $BASE_DIR/scripts/${script}.sh)? (S/n) " ${quiet}
done
