#!/bin/bash
BASE_DIR=$(dirname "$(readlink -f "$0")")

echo -e 'Inicializando, por favor, espere ...'
source $BASE_DIR/lib/params.sh
source $BASE_DIR/lib/sources.sh
source $BASE_DIR/lib/helper.sh
source $BASE_DIR/scripts/packages.sh
source $BASE_DIR/scripts/theme.sh

clear

message "\nConfiguración personal de Ubuntu ${CURRENT_OS_VERSION}"
check_os_version
#update_packages
#install_packages
install_theme