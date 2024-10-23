#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Lista de scripts a ejecutar.
SCRIPTS='postgresql packages extensions theme icons dconf terminal fonts directory wayland git'
#SCRIPTS='git'

# Redireccion a null.
NULL='/dev/null'

# Versión recomendada para la instalación del script.
OS_VERSION='24.04'

# Url del recurso de barra de progreso.
PROGRESSBAR='https://gist.githubusercontent.com/alonsorgr/74d6d02ffeb6b4d3d23cc56933234f5c/raw/5c2b8a821ccec866f86136bc8c249c0850314bec/progressbar.sh'

# Color primario para 'elementos seleccionados'.
SELECTION_COLOR=#BFBFBF

# Color secundario para notificaciones y OSD.
ACCENT_COLOR=#FFFFFF

# Color terciario para botones 'destructivos'.
SUGGESTION_COLOR=#CCCCCC

# Lista de paquetes Snap para la eliminación de Snap del sistema.
SNAP_PACKAGES='bare core22 firefox firmware-updater gnome-42-2204 gtk-common-themes gtk-theme-orchis snap-store snapd snapd-desktop-integration'

# Url de descarga directa de Google Chrome
GOOGLE_CHROME_DEB_URL='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'

# Url de descarga directa de Visual Studio Code
VS_CODE_DEB_URL='https://update.code.visualstudio.com/latest/linux-deb-x64/stable'

# Url de descarga directa de GitHub CLI.
GITHUB_CLI_URL='https://cli.github.com/packages'

# Clave del repositorio de GitHub CLI.
GITHUB_CLI_KEY='C99B11DEB97541F0'

# Última versión de PostgreSQL
POSTGRESQL_VERSION="17"

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

FONTS_LIST="fira-code input-mono menlo mononoki nerd-fonts"

FONTS_COUNT=$(echo ${FONTS_LIST} | wc -w)

# Archivo de configuración de GDM
GDM_CONF='/etc/gdm3/custom.conf'

# Archivo de configuración css gtk-3.0.
GTK_CONFIG="${HOME}/.config/gtk-3.0/gtk.css"

# Configuración de headerbar css gtk-3.0.
GTK_HEADERBAR_URL='https://gist.githubusercontent.com/alonsorgr/3f6a63bb39bc092f16894f3fabb1bc86/raw/c636b3c5589a88b433b9c42338fd2ae3c2aa5116/gtk.css'

# Url del repositorio de la extensión Clipboard Indicator.
CLIPBOARD_INDICATOR_URL='https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git'

# Url del repositorio de la extensión Dash To Panel.
DASH_TO_PANEL_URL='https://github.com/home-sweet-gnome/dash-to-panel.git'

# Url del repositorio de la extensión Easy Screen Cast.
EASY_SCREEN_CAST_URL='https://github.com/EasyScreenCast/EasyScreenCast.git'

# Url del repositorio de la extensión Screenshot Tool.
SCREENSHOT_URL='https://github.com/OttoAllmendinger/gnome-shell-screenshot.git'

# Url del repositorio de la extensión Simpler Off Menu.
SIMPLER_OF_MENU_URL='https://gitlab.com/K3rcus/simpler-off-menu.git'

# Directorio de recursos de extensiones.
PREFIX_SRC="${__DIR__}/gnome/extensions"

# Directorio de configuración de Screenshot Tool.
SCREENSHOT_TOOL_CONFIG="${__DIR__}/gnome/extensions/screenshot-tool"

# Directorio de destino de extensiones.
PREFIX_EXT_DST="$HOME/.local/share/gnome-shell/extensions"

# Directorio de destino de Clipboard Indicator.
CLIPBOARD_INDICATOR_DST="${PREFIX_EXT_DST}/clipboard-indicator@tudmotu.com"

# Directorio de destino de Screenshot Tool.
SCREENSHOT_TOOL_DST="${PREFIX_EXT_DST}/gnome-shell-screenshot@ttll.de"

# Directorio de destino de Simpler Off Menu.
SIMPLER_OFF_MENU_DST="${PREFIX_EXT_DST}/SimplerOffMenu.kerkus@pm.me"

# Directorio de ricpelo/conf
RICPELO_CONF="${HOME}/.conf"

# Repositorio de ricpelo/conf
RICPELO_REPO='https://github.com/alonsorgr/conf.git'
