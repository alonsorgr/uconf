#!/bin/bash

message 'Intsalación de controladores para teclado Logitech K290'
cd ${BASE_DIR}/drivers/k290-fnkeyctl/
call_command "sudo ./build.sh" "Compilando drivers FN key Logitech K290, por favor, espere ..." "Error al compilar los drivers FN key Logitech K290"
call_command "sudo ./install.sh" "Instalando drivers FN key Logitech K290, por favor, espere ..." "Error al instalar los drivers FN key Logitech K290"
success_message 'Instalación de controladores para teclado Logitech K290 terminada\n'
cd ${BASE_DIR}