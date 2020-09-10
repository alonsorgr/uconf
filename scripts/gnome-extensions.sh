#!/bin/bash

USR_PATH='/usr/share/gnome-shell/extensions/'
HOME_PATH='$HOME/.local/share/gnome-shell/extensions/'

DST_PREFIX="$HOME/.local/share/gnome-shell/extensions"

DST_SCREENSHOT_TOOL=${DST_PREFIX}'/gnome-shell-screenshot@ttll.de'
DST_CLIPBOARD_INDICATOR=${DST_PREFIX}'/clipboard-indicator@tudmotu.com'
DST_DASH_TO_PANEL='dash-to-panel@jderose9.github.com'
DST_EASY_SCREEN_CAST=${DST_PREFIX}'/EasyScreenCast@iacopodeenosee.gmail.com'
DST_SIMPLE_OFF_MENU=${DST_PREFIX}'/SimplerOffMenu.kerkus@pm.me'
DST_USER_THEMES=${DST_PREFIX}'/user-theme@gnome-shell-extensions.gcampax.github.com'

SRC_PREFIX="${BASE_DIR}/gnome/extensions"

SRC_SCREENSHOT_TOOL=${SRC_PREFIX}'/screenshot-tool'
SRC_CLIPBOARD_INDICATOR=${SRC_PREFIX}'/clipboard-indicator'
SRC_DASH_TO_PANEL=${SRC_PREFIX}'/dash-to-panel'
SRC_EASY_SCREEN_CAST=${SRC_PREFIX}'/easy-screen-cast'
SRC_SIMPLE_OFF_MENU=${SRC_PREFIX}'/simpler-off-menu'
SRC_USER_THEMES=${SRC_PREFIX}'/gnome-shell-extensions/extensions/user-theme'

LBL_SCREENSHOT_TOOL='Screenshot Tool'
LBL_CLIPBOARD_INDICATOR='Cipboard Indicator'
LBL_DASH_TO_PANEL='Dash To Panel'
LBL_EASY_SCREEN_CAST='Easy Screen Cast'
LBL_SIMPLE_OFF_MENU='Simpler Off Menu'
LBL_USER_THEMES='User Theme'

message 'Instalación de extensiones de GNOME'

execute "make -C ${SRC_EASY_SCREEN_CAST}" "Configurándo extensión ${LBL_EASY_SCREEN_CAST}, por favor, espere ..." "Error al configurar la extensión ${LBL_EASY_SCREEN_CAST}"

execute "make -C ${SRC_SCREENSHOT_TOOL}" "Configurándo extensión ${LBL_SCREENSHOT_TOOL}, por favor, espere ..." "Error al configurar la extensión ${LBL_SCREENSHOT_TOOL}"

execute "make -C ${SRC_DASH_TO_PANEL}" "Configurándo extensión ${LBL_DASH_TO_PANEL}, por favor, espere ..." "Error al configurar la extensión ${LBL_DASH_TO_PANEL}"

execute "cp -r ${SRC_CLIPBOARD_INDICATOR}/* ${DST_CLIPBOARD_INDICATOR}" "Instalando extensión ${LBL_CLIPBOARD_INDICATOR}, por favor, espere ..." "Error al instalar la extensión ${LBL_CLIPBOARD_INDICATOR}"

execute "cp -r ${SRC_SIMPLE_OFF_MENU}/* ${DST_SIMPLE_OFF_MENU}" "Instalando extensión ${LBL_SIMPLE_OFF_MENU}, por favor, espere ..." "Error al instalar la extensión ${LBL_SIMPLE_OFF_MENU}"

execute "cp -r ${SRC_USER_THEMES} ${DST_USER_THEMES}" "Instalando extensión ${LBL_USER_THEMES}, por favor, espere ..." "Error al instalar la extensión ${LBL_USER_THEMES}"

execute "make install -C ${SRC_EASY_SCREEN_CAST}" "Instalando extensión ${LBL_EASY_SCREEN_CAST}, por favor, espere ..." "Error al instlar la extensión ${LBL_EASY_SCREEN_CAST}"

execute "make install -C ${SRC_SCREENSHOT_TOOL}" "Instalando extensión ${LBL_SCREENSHOT_TOOL}, por favor, espere ..." "Error al instalar la extensión ${LBL_SCREENSHOT_TOOL}" && cp -r "${SRC_SCREENSHOT_TOOL}-config"/* "${DST_SCREENSHOT_TOOL}"

execute "make install -C ${SRC_DASH_TO_PANEL}" "Instalando extensión ${LBL_DASH_TO_PANEL}, por favor, espere ..." "Error al instlar la extensión ${LBL_DASH_TO_PANEL}"

execute "gnome-extensions enable ${DST_SCREENSHOT_TOOL}" "Inicializando extensión ${LBL_SCREENSHOT_TOOL}, por favor, espere ..." "Error al inicializar la extensión ${SRC_SCREENSHOT_TOOL}"

execute "gnome-extensions enable ${DST_CLIPBOARD_INDICATOR}" "Inicializando extensión ${LBL_CLIPBOARD_INDICATOR}, por favor, espere ..." "Error al inicializar la extensión ${SRC_CLIPBOARD_INDICATOR}"

execute "gnome-extensions enable ${DST_DASH_TO_PANEL}" "Inicializando extensión ${LBL_DASH_TO_PANEL}, por favor, espere ..." "Error al inicializar la extensión ${LBL_DASH_TO_PANEL}"

execute "gnome-extensions enable ${DST_EASY_SCREEN_CAST}" "Inicializando extensión ${LBL_EASY_SCREEN_CAST}, por favor, espere ..." "Error al inicializar la extensión ${LBL_EASY_SCREEN_CAST}"

execute "gnome-extensions enable ${DST_SIMPLE_OFF_MENU}" "Inicializando extensión ${LBL_SIMPLE_OFF_MENU}, por favor, espere ..." "Error al inicializar la extensión ${LBL_SIMPLE_OFF_MENU}"

execute "gnome-extensions enable ${DST_USER_THEMES}" "Inicializando extensión ${LBL_USER_THEMES}, por favor, espere ..." "Error al inicializar la extensión ${LBL_USER_THEMES}"

success_message 'Instalación de extensiones de GNOME terminada\n'