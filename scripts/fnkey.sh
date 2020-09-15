#!/bin/bash

# Name:Intsalación de controladores de tecla FN para teclado Logitech K290
cd "${__DIR__}/drivers/k290-fnkeyctl/"
message 'Compilando controladores de tecla FN para teclado Logitech K290, espere ...'
run sudo './build.sh'
errors "Error en la intsalación de controladores de tecla FN para teclado Logitech K290"
message 'Instalando controladores de tecla FN para teclado Logitech K290, espere ...'
run sudo './install.sh'
errors "Error en la intsalación de controladores de tecla FN para teclado Logitech K290"