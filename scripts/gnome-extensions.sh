#!/bin/bash

# Name:Extensiones de entorno de esctritorio GNOME

CLIPBOARD_INDICATOR_URL='https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git'
DASH_TO_PANEL_URL='https://github.com/home-sweet-gnome/dash-to-panel.git'
EASY_SCREEN_CAST_URL='https://github.com/EasyScreenCast/EasyScreenCast.git'
SCREENSHOT_URL='https://github.com/OttoAllmendinger/gnome-shell-screenshot.git'
SIMPLER_OF_MENU_URL='https://gitlab.com/K3rcus/simpler-off-menu.git'

PREFIX_SRC="${BASE_DIR}/gnome/extensions"
SCREENSHOT_TOOL_CONFIG="${BASE_DIR}/gnome/extensions/screenshot-tool"

PREFIX_DST="$HOME/.local/share/gnome-shell/extensions"
CLIPBOARD_INDICATOR_DST="${PREFIX_DST}/clipboard-indicator@tudmotu.com"
SCREENSHOT_TOOL_DST="${PREFIX_DST}/gnome-shell-screenshot@ttll.de"
SIMPLER_OFF_MENU_DST="${PREFIX_DST}/SimplerOffMenu.kerkus@pm.me"



function _install() {
    local temp="$(mktemp -d)"
    execute "git clone $1 ${temp}" "Descargándo extensión $2, por favor, espere ..." "Error al descargar la extensión $2"
    execute "make -C ${temp}" "Configurándo extensión $2, por favor, espere ..." "Error al configurar la extensión $2"
    execute "make install -C ${temp}" "Instalando extensión, por favor, espere ..." "Error al instalar la extensión $2"
    rm -rf ${temp}
}

function _clone() {
    [ -d $2 ] && execute "rm -rf $2" "Eliminando instalación anterior de $3, por favor, espere ..." "Error al eliminar la instalación anterior de la extensión $3"
    execute "git clone $1 $2" "Descargando e instalando $3, por vafor, espere ..." "Error al descargar e instalar la extensión $3"
}

#_clone ${CLIPBOARD_INDICATOR_URL} ${CLIPBOARD_INDICATOR_DST} "Clipboard Indicator"
#_install ${DASH_TO_PANEL_URL} "Dash To Panel"
#_install ${EASY_SCREEN_CAST_URL} "Easy Screen Cast"
#_install ${SCREENSHOT_URL} "Screenshot Tool"
#cp -r "${SCREENSHOT_TOOL_CONFIG}"/* "${SCREENSHOT_TOOL_DST}"
#_clone ${SIMPLER_OF_MENU_URL} ${SIMPLER_OFF_MENU_DST} "Simpler Off Menu"
