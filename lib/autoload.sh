#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Comprobando dependencia curl
apt_install curl

# Recurso importado: progressbar.sh
source <(curl -sLo- "${PROGRESSBAR}") && bar::start && bar::stop
