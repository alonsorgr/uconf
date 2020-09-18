#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Importación de configuración de ricpelo/conf

CONF_LST="atom i3 pulseaudio pasystray pavucontrol"
SCRIPTS_LST="atom-postinstall.sh code-install.sh git-config.sh"

clone "${RICPELO_REPO}" "${RICPELO_CONF}" 'ricpelo/conf'

message "Configurándo el script de ricpelo/conf, espere ..."

for item in ${CONF_LST}; do
    sed -i 's/'${item}'//g' "${RICPELO_CONF}/conf.sh"
    errors "Error al eliminar ${item} de la configuración"
done

for item in ${SCRIPTS_LST}; do
    sed -i 's/'${item}'//g' "${RICPELO_CONF}/scripts/scripts.sh"
    errors "Error al eliminar ${item} de la configuración"
done

gunzip "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"i3						install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"i3-wm						install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"i3lock						install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"i3status					install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"pulseaudio					install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
sed -i s/"pulseaudio-utils				install"//g "${RICPELO_CONF}/apt/dpkg--get-selections.txt"
gzip "${RICPELO_CONF}/apt/dpkg--get-selections.txt"

message "Instalándo la configuración de ricpelo/conf, espere ..."
(cd ${RICPELO_CONF} && ./conf.sh -q &> ${NULL})
