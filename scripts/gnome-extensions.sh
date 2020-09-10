#!/bin/bash

USR_PATH='/usr/share/gnome-shell/extensions/'
HOME_PATH='$HOME/.local/share/gnome-shell/extensions/'

DST_PREFIX="$HOME/.local/share/gnome-shell/extensions"

NAMESPACE_DST_SCREENSHOT_TOOL='gnome-shell-screenshot@ttll.de'
NAMESPACE_DST_CLIPBOARD_INDICATOR='clipboard-indicator@tudmotu.com'
NAMESPACE_DST_DASH_TO_PANEL='dash-to-panel@jderose9.github.com'
NAMESPACE_DST_EASY_SCREEN_CAST='EasyScreenCast@iacopodeenosee.gmail.com'
NAMESPACE_DST_SIMPLE_OFF_MENU='SimplerOffMenu.kerkus@pm.me'
NAMESPACE_DST_USER_THEMES='user-theme@gnome-shell-extensions.gcampax.github.com'

SRC_PREFIX="${BASE_DIR}/gnome/extensions"

NAMESPACE_SRC_SCREENSHOT_TOOL='screenshot-tool'
NAMESPACE_SRC_CLIPBOARD_INDICATOR='clipboard-indicator'
NAMESPACE_SRC_DASH_TO_PANEL='dash-to-panel'
NAMESPACE_SRC_EASY_SCREEN_CAST='easy-screen-cast'
NAMESPACE_SRC_SIMPLE_OFF_MENU='simpler-off-menu'
NAMESPACE_SRC_USER_THEMES='gnome-shell-extensions/extensions/user-theme'

message 'Instalación de extensiones de GNOME'

execute "make -C ${SRC_PREFIX}/${NAMESPACE_SRC_EASY_SCREEN_CAST}" "Configurándo extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}, por favor, espere ..." "Error al configurar la extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}"

execute "make -C ${SRC_PREFIX}/${NAMESPACE_SRC_SCREENSHOT_TOOL}" "Configurándo extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}, por favor, espere ..." "Error al configurar la extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}"

execute "make -C ${SRC_PREFIX}/${NAMESPACE_SRC_DASH_TO_PANEL}" "Configurándo extensión ${NAMESPACE_SRC_DASH_TO_PANEL}, por favor, espere ..." "Error al configurar la extensión ${NAMESPACE_SRC_DASH_TO_PANEL}"

execute "cp -r ${SRC_PREFIX}/${NAMESPACE_SRC_CLIPBOARD_INDICATOR}/* ${DST_PREFIX}/${NAMESPACE_DST_CLIPBOARD_INDICATOR}" "Instalando extensión ${NAMESPACE_SRC_CLIPBOARD_INDICATOR}, por favor, espere ..." "Error al instalar la extensión ${NAMESPACE_SRC_CLIPBOARD_INDICATOR}"

execute "cp -r ${SRC_PREFIX}/${NAMESPACE_SRC_SIMPLE_OFF_MENU}/* ${DST_PREFIX}/${NAMESPACE_DST_SIMPLE_OFF_MENU}" "Instalando extensión ${NAMESPACE_SRC_SIMPLE_OFF_MENU}, por favor, espere ..." "Error al instalar la extensión ${NAMESPACE_SRC_SIMPLE_OFF_MENU}"

execute "cp -r ${SRC_PREFIX}/${NAMESPACE_SRC_USER_THEMES} ${DST_PREFIX}/${NAMESPACE_DST_USER_THEMES}" "Instalando extensión ${NAMESPACE_SRC_USER_THEMES}, por favor, espere ..." "Error al instalar la extensión ${NAMESPACE_SRC_USER_THEMES}"

execute "make install -C ${SRC_PREFIX}/${NAMESPACE_SRC_EASY_SCREEN_CAST}" "Instalando extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}, por favor, espere ..." "Error al instlar la extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}"

execute "make install -C ${SRC_PREFIX}/${NAMESPACE_SRC_SCREENSHOT_TOOL}" "Instalando extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}, por favor, espere ..." "Error al instalar la extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}" && cp -r "${SRC_PREFIX}/${NAMESPACE_SRC_SCREENSHOT_TOOL}-config"/* "${DST_PREFIX}/${NAMESPACE_DST_SCREENSHOT_TOOL}"

execute "make install -C ${SRC_PREFIX}/${NAMESPACE_SRC_DASH_TO_PANEL}" "Instalando extensión ${NAMESPACE_SRC_DASH_TO_PANEL}, por favor, espere ..." "Error al instlar la extensión ${NAMESPACE_SRC_DASH_TO_PANEL}"

execute "gnome-extensions enable ${NAMESPACE_DST_SCREENSHOT_TOOL}" "Inicializando extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_SCREENSHOT_TOOL}"

execute "gnome-extensions enable ${NAMESPACE_DST_CLIPBOARD_INDICATOR}" "Inicializando extensión ${NAMESPACE_SRC_CLIPBOARD_INDICATOR}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_CLIPBOARD_INDICATOR}"

execute "gnome-extensions enable ${NAMESPACE_DST_DASH_TO_PANEL}" "Inicializando extensión ${NAMESPACE_SRC_DASH_TO_PANEL}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_DASH_TO_PANEL}"

execute "gnome-extensions enable ${NAMESPACE_DST_EASY_SCREEN_CAST}" "Inicializando extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_EASY_SCREEN_CAST}"

execute "gnome-extensions enable ${NAMESPACE_DST_SIMPLE_OFF_MENU}" "Inicializando extensión ${NAMESPACE_SRC_SIMPLE_OFF_MENU}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_SIMPLE_OFF_MENU}"

execute "gnome-extensions enable ${NAMESPACE_DST_USER_THEMES}" "Inicializando extensión ${NAMESPACE_SRC_USER_THEMES}, por favor, espere ..." "Error al inicializar la extensión ${NAMESPACE_SRC_USER_THEMES}"

success_message 'Instalación de extensiones de GNOME terminada\n'