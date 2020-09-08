#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

function install_logitech_k290_drivers() {
    message 'Intsalación de controladores para teclado Logitech K290'
    cd ${BASE_DIR}/drivers/k290-fnkeyctl/
    echo -e 'Compilando drivers, por favor, espere ...'
    sudo ./build.sh &> ${NULL}
    echo -e 'Instalando drivers, por favor, espere ...'
    sudo ./install.sh &> ${NULL}
    success_message 'Instalación de controladores para teclado Logitech K290 terminada\n'
}