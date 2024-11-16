#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Lista de scripts a ejecutar.
SCRIPTS='packages extensions theme terminal fonts directory dconf git'
#SCRIPTS='directory'

# Redireccion a null.
NULL='/dev/null'

# Versión recomendada para la instalación del script
OS_VERSION='24.04'

# Url del recurso de barra de progreso
PROGRESSBAR='https://gist.githubusercontent.com/alonsorgr/74d6d02ffeb6b4d3d23cc56933234f5c/raw/5c2b8a821ccec866f86136bc8c249c0850314bec/progressbar.sh'

# Color de fonddo del tema GTK
MELALLIAN_COLOR=#15181f

# Lista de paquetes Snap para la eliminación de Snap del sistema
SNAP_PACKAGES='firefox firmware-updater gnome-42-2204 gtk-common-themes gtk-theme-orchis snap-store snapd-desktop-integration bare core22'

# Url de descarga directa de Google Chrome
GOOGLE_CHROME_DEB_URL='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'

# Url de descarga directa de Visual Studio Code
VS_CODE_DEB_URL='https://update.code.visualstudio.com/latest/linux-deb-x64/stable'

# Url de descarga directa de Warp Terminal
WARP_TERMINARL_DEB_URL='https://app.warp.dev/download?package=deb'

# Última versión de PostgreSQL
POSTGRESQL_VERSION='17'

# Directorio de configuración de PostgreSQL
POSTGRESQL_CONFIG="/etc/postgresql/${POSTGRESQL_VERSION}/main/postgresql.conf"

# Lista de repositorios a instalar
REPOSITORIES_LIST=$(cat ${__DIR__}/config/repositories.cfg)

# Número de repositorios a instalar
REPOSITORIES_COUNT=$(echo ${REPOSITORIES_LIST} | wc -w)

# Lista de paquetes a instalar
PACKAGES_LIST=$(cat ${__DIR__}/config/packages.cfg)

# Número de paquetes a instalar
PACKAGES_COUNT=$(echo ${PACKAGES_LIST} | wc -w)

# Lista de extensiones de gnome a instalar
GNOME_EXTENSIONS_LIST=$(cat ${__DIR__}/config/gnome-extensions.cfg)

# Número de extensiones de gnome a instalar
GNOME_EXTENSIONS_COUNT=$(echo ${GNOME_EXTENSIONS_LIST} | wc -w)

# Url base para descarga de extensiones de Gnome en su versión 46
GNOME_EXTENSIONS_BASEURL='https://extensions.gnome.org/api/v1/extensions/'

# Ruta de destino de extensiones de Gnome
GNOME_EXTENSIONS_BASEPATH="$HOME/.local/share/gnome-shell/extensions/"

# Lista de tipografías a instalar
FONTS_LIST="fira-code input-mono menlo mononoki nerd-fonts"

# Número de tipografías a instalar
FONTS_COUNT=$(echo ${FONTS_LIST} | wc -w)
