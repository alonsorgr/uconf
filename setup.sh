#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

ARGS=$#

function params() {
    if [ ${ARGS} -gt 1 ] && [ "$1" == '--help' ]; then
        echo -e "La ayuda solo se puede solicitar con un parámetro enla lísta de argumentos"
        exit
    fi
    if [ ${ARGS} -le 2 ]; then
        if [ ! -n "$1" ]; then
            debug='' && quiet=''
        elif [ "$1" == "--help" ]; then
            ${BASE_DIR}/help.sh
            exit
        elif [ "$1" == '--quiet' ]; then
            quiet='-y'
        elif [ "$1" == '--debug' ]; then
            debug='--debug'
        else
            echo -e "Parámetro $1 no válido, por favor, consulte la ayuda"
            echo -e "Ayuda: ./setup --help"
            exit 1 
        fi 
    else
        echo -e "El número de argumentos no es válido, por favor, consulte la ayuda"
        echo -e "Ayuda: ./setup --help"
        exit 1
    fi
}

params $1
params $2

echo -e 'Inicializando, por favor, espere ...'

source ${BASE_DIR}/lib/params.sh
source ${BASE_DIR}/lib/helper.sh ${debug}

message "\nConfiguración personal de Ubuntu ${OS_VERSION}\n"

execute "sudo apt install curl -y" "Instalando dependencia $(package_info "curl"), por favor, espere ..." "Error al instalar la dependencia $(package_info "curl")"
success_message "Intslación de dependencia $(package_info "curl") terminada\n"

source ${BASE_DIR}/lib/sources.sh

# SCRIPTS='packages drivers gnome-extensions theme icons wayland fonts'
SCRIPTS='icons'

module_update
success_message 'Actualización de módulos terminada\n'

#[ "$1" == '-y' ] && quiet='-y' || quiet=''

for script in ${SCRIPTS}; do
    question "source $BASE_DIR/scripts/${script}.sh" "¿Desea ejecutar el script $(script_name $BASE_DIR/scripts/${script}.sh)? (S/n) " ${quiet}
done
