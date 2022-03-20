#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Extensiones de entorno de esctritorio GNOME

function _install() {
    local temp="$(mktemp -d)"
    message "Descargando extensión de GNOME $2, espere ..."
    run git clone "$1" ${temp}
    errors "Error al descargar la extensión de GNOME $2"

    message "Configurándo extensión de GNOME $2, espere ..."
    run make -C ${temp}
    errors "Error al configurar la extensión de GNOME $2"

    message "Instalando extensión de GNOME $2, espere ..."
    run make install -C ${temp}
    errors "Error al instalar la extensión de GNOME $2"
    rm -rf ${temp}
}

function _clone() {
    message "Eliminando instalación anterior de $3, espere ..."
    [ -d "$2" ] && run rm -rf "$2"
    message "Descargando e instalando $3, espere ..."
    run git clone "$1" "$2"
    errors "Error al descargar e instalar la extensión $3"
}

function _init() {
    message "Inicializando extensión $2, espere ..."
    run gnome-extensions enable "$1"
    errors "Error al inicializar la extensión $2"
}

_clone ${CLIPBOARD_INDICATOR_URL} ${CLIPBOARD_INDICATOR_DST} "Clipboard Indicator"
_init 'clipboard-indicator@tudmotu.com' 'Clipboard Indicator'
_install ${DASH_TO_PANEL_URL} "Dash To Panel"
_init 'dash-to-panel@jderose9.github.com' 'Dash To Panel'
_install ${SCREENSHOT_URL} "Screenshot Tool"
_init 'gnome-shell-screenshot@ttll.de' 'Screenshot Tool'
message "Aplicando traducciones al español a Screenshot Tool, espere ..."
run cp -r "${SCREENSHOT_TOOL_CONFIG}"/* "${SCREENSHOT_TOOL_DST}"
errors "Error al aplicar las traducciones a Screenshot Tool"
_clone ${SIMPLER_OF_MENU_URL} ${SIMPLER_OFF_MENU_DST} "Simpler Off Menu"
_init 'SimplerOffMenu.kerkus@pm.me' 'Simpler Off Menu'
_init 'user-theme@gnome-shell-extensions.gcampax.github.com' 'User Themes'
