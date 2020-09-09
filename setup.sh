#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

echo -e 'Inicializando, por favor, espere ...'

source $BASE_DIR/lib/params.sh
source $BASE_DIR/lib/sources.sh
source $BASE_DIR/lib/helper.sh

SCRIPTS='packages drivers theme icons'

message "\nConfiguración personal de Ubuntu 20.04\n"

[ "$1" == '-y' ] && quiet='-y' || quiet=''

for script in ${SCRIPTS}; do
    question "source $BASE_DIR/scripts/${script}.sh" "¿Desea ejecutar el script ${script}.sh? (S/n) " ${quiet}
done
