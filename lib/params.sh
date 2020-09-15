#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Lista de scripts a ejecutar.
SCRIPTS='packages'

# Redireccion a null.
NULL='/dev/null'

# Versión recomendada para la instalación del script.
OS_VERSION='20.04'

# Url del recurso de barra de progreso.
PROGRESSBAR='https://gist.githubusercontent.com/alonsorgr/74d6d02ffeb6b4d3d23cc56933234f5c/raw/5c2b8a821ccec866f86136bc8c249c0850314bec/progressbar.sh'

# Color primario para 'elementos seleccionados'.
SELECTION_COLOR=#BFBFBF

# Color secundario para notificaciones y OSD.
ACCENT_COLOR=#FFFFFF

# Color terciario para botones 'destructivos'.
SUGGESTION_COLOR=#CCCCCC

# Lista de paquetes Snap para la eliminación de Snap del sistema.
SNAP_PACKAGES='snap-store gtk-common-themes gnome-3-34-1804 core18'

# Url de descarga directa de Google Chrome
GOOGLE_CHROME_DEB_URL='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'

# Url de descarga directa de Visual Studio Code
VS_CODE_DEB_URL='https://update.code.visualstudio.com/latest/linux-deb-x64/stable'

# Url de descarga directa de GitHub CLI.
GITHUB_CLI_URL='https://cli.github.com/packages'

# Clave del repositorio de GitHub CLI.
GITHUB_CLI_KEY='C99B11DEB97541F0'

# Lista de repositorios a instalar
REPOSITORIES_LIST=$(cat ${__DIR__}/config/repositories.cfg)

# Número de repositorios a instalar
REPOSITORIES_COUNT=$(echo ${REPOSITORIES_LIST} | wc -w)

# Lista de paquetes a instalar
PACKAGES_LIST=$(cat ${__DIR__}/config/packages.cfg)

# Número de paquetes a instalar
PACKAGES_COUNT=$(echo ${PACKAGES_LIST} | wc -w)