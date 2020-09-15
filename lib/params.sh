#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Lista de scripts a ejecutar.
SCRIPTS='oh-my-zsh'

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

# Lista de tipografías.
FONTS_LIST=$(cat "${__DIR__}/config/fonts.cfg")

# Directorio de origen de tipografías.
SRC_FONTS="${__DIR__}/fonts"

# Directorio de destino de tipografías.
DST_FONTS="${HOME}/.local/share/fonts"

# Archivo de configuración de GDM
GDM_CONF='/etc/gdm3/custom.conf'

# Ruta del ejecutable del emulador de terminal Sakura.
SAKURA_BIN_PATH="/usr/bin/sakura"

# Archivo de configuración css gtk-3.0.
GTK_CONFIG="${HOME}/.config/gtk-3.0/gtk.css"

# Configuración de headerbar css gtk-3.0.
GTK_HEADERBAR_URL='https://gist.githubusercontent.com/alonsorgr/3f6a63bb39bc092f16894f3fabb1bc86/raw/c4fabdcadf39918c11d25ab2ede79251ff06a879/gtk.css'

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