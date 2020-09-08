#!/bin/bash
BASE_DIR=$(dirname "$(readlink -f "$0")")

echo -e 'Inicializando, por favor, espere ...'
source $BASE_DIR/lib/config.sh
source $BASE_DIR/lib/helper.sh
source $BASE_DIR/scripts/packages.sh

clear

message "\nConfiguración personal de Ubuntu ${CURRENT_OS_VERSION}"
check_os_version
install_packages