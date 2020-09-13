#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

ARGS=$#

function params() {
    if [ ${ARGS} -gt 1 ] && [ "$1" == '--help' ]; then
        echo -e "La ayuda solo se puede solicitar con un parámetro enla lísta de argumentos"
        exit
    fi
    if [ ${ARGS} -gt 2 ]; then
        echo -e "El número de argumentos no es válido, consulte la ayuda"
        echo -e "Ayuda: ./setup --help"
        exit 1
    fi
    if [ ${ARGS} -le 2 ]; then
        if [ -n "$1" ]; then
            if [ "$1" == "--help" ]; then
                less ${BASE_DIR}/help
                exit
            elif [ "$1" == "--yes" ]; then
                yes='-y'
            elif [ "$1" == '--verbose' ]; then
                verbose='--verbose'
            else
                echo -e "Parámetro $1 no válido, consulte la ayuda"
                echo -e "Ayuda: ./setup --help"
                exit 1 
            fi
        fi
    else
        echo -e "El número de argumentos no es válido, consulte la ayuda"
        echo -e "Ayuda: ./setup --help"
        exit 1
    fi
}

if [ "${BASE_DIR}" != "${PWD}" ]; then
    error_message "Error: debe ejecutar el script desde el directorio ${BASE_DIR}"
    exit 1
fi

params $1
params $2

echo -e 'Inicializando, espere ...'

source ${BASE_DIR}/lib/params.sh
source ${BASE_DIR}/lib/helper.sh ${verbose}

message "\nConfiguración personal de Ubuntu ${OS_VERSION}\n"

execute "sudo apt install curl -y" "Instalando dependencia $(package_info "curl"), espere ..." "Error al instalar la dependencia $(package_info "curl")"
success_message "Intslación de dependencia $(package_info "curl") terminada\n"

source ${BASE_DIR}/lib/sources.sh

#SCRIPTS='packages drivers gnome-extensions theme icons wayland fonts dconf'
SCRIPTS='dconf'

module_update
success_message 'Actualización de módulos terminada\n'

for script in ${SCRIPTS}; do
    question "source $BASE_DIR/scripts/${script}.sh" "¿Desea ejecutar el script $(script_name $BASE_DIR/scripts/${script}.sh)? (S/n) " "${yes}"
done
