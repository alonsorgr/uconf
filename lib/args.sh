#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

function check_param()
##
#   Comprueba los parámetros de entrada del script
#   @param $1   Parámetro a comprobar.
{
    declare -i args=$2
    if [ ${args} -gt 1 ] && [ "$1" == '--help' ]; then
        echo -e "La ayuda solo se puede solicitar con un parámetro enla lísta de argumentos"
        exit
    fi
    if [ ${args} -gt 3 ]; then
        echo -e "El número de argumentos no es válido, consulte la ayuda"
        echo -e "Ayuda: ./setup --help"
        exit 1
    fi
    if [ ${args} -le 3 ]; then
        if [ -n "$1" ]; then
             if [ "$1" == "--help" ]; then
                less ${__DIR__}/help
                exit
            elif [ "$1" == "--yes" ]; then
                yes='-y'
            elif [ "$1" == '--verbose' ]; then
                verbose='--verbose'
            elif [ "$1" == '--exit' ]; then
                exit='--exit'
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