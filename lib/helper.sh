#!/bin/bash

debug="$1"

function message() {
    echo -e "\033[0;34m$1\033[0m"
}

function success_message() {
    echo -e "\033[0;32m$1\033[0m"
}

function error_message() {
    echo -e "\033[0;31m$1\033[0m"
}

function question() {
    if [[ $3 == -y ]]; then
        $1
    else
        while true; do
            read -p "$2" result
            case ${result} in
                [Ss]* ) $1; break;;
                [Nn]* ) break;;
                * ) echo "Por favor, conteste sí o no (S/n)";;
            esac
        done
    fi
}

function check_errors() {
    if [ $? -ne 0 ]; then
        error_message "$1"
    fi
}

function package_info() {
    echo -e "($1-v.$(apt-cache show "$1" | grep Version | cut -d: -f2 | tr -d '[:space:]'))"
}

function execute() {
    echo -e "$2"
    [ "${debug}" == "--debug" ] && $1 || $1 &> ${NULL}
    check_errors "$3"
}

function install_package() {
    execute "sudo apt-get install -y $1" "Instalando $(package_info "$1"), por favor, espere ..." "Error al instalar el paquete '$(package_info "$1")"
}

function enable_repository() {
    execute "sudo add-apt-repository -y ppa:$1" "Activando repositorio "$1", por favor, espere ..." "Error al activar el repositorio $1"
}

function apt_update() {
    execute "sudo apt-get update -y" "Actualizando la lista de paquetes instalados, por favor, espere ..." "Error al actualizar la lista de paquetes"
    execute "sudo apt-get upgrade -y" "Actualizando paquetes instalados, por favor, espere ..." "Error al actualizar los paquetes"
}

function apt_clean() {
    execute "sudo apt autoremove -y" "Eliminando paquetes innecesarios, por favor, espere ..." "Error al eliminar paquetes innecesarios"
    execute "sudo apt autoclean -y" "Limpiando el sistema, por favor, espere ..." "Error al limpiar el sistema"
}

function module_update() {
    execute "git submodule update --init --recursive" "Actualizando múdulos, por favor, espere ..." "Error al actualizar los módulos"
}

function script_name() {
    cat $1 | grep Name: | cut -d ':' -f2
}