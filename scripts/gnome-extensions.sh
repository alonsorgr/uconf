#!/bin/bash

# Name:Extensiones de entorno de esctritorio GNOME

USR_PATH='/usr/share/gnome-shell/extensions/'
HOME_PATH='$HOME/.local/share/gnome-shell/extensions/'

SRC_PREFIX="${BASE_DIR}/gnome/extensions"

SRC_SCREENSHOT_TOOL=${SRC_PREFIX}'/screenshot-tool'
SRC_CLIPBOARD_INDICATOR=${SRC_PREFIX}'/clipboard-indicator'
SRC_DASH_TO_PANEL=${SRC_PREFIX}'/dash-to-panel'
SRC_EASY_SCREEN_CAST=${SRC_PREFIX}'/easy-screen-cast'
SRC_SIMPLE_OFF_MENU=${SRC_PREFIX}'/simpler-off-menu'
SRC_USER_THEMES=${SRC_PREFIX}'/gnome-shell-extensions/extensions/user-theme'

DST_PREFIX="$HOME/.local/share/gnome-shell/extensions"

DST_SCREENSHOT_TOOL=${DST_PREFIX}'/gnome-shell-screenshot@ttll.de'
DST_CLIPBOARD_INDICATOR=${DST_PREFIX}'/clipboard-indicator@tudmotu.com'
DST_DASH_TO_PANEL='dash-to-panel@jderose9.github.com'
DST_EASY_SCREEN_CAST=${DST_PREFIX}'/EasyScreenCast@iacopodeenosee.gmail.com'
DST_SIMPLE_OFF_MENU=${DST_PREFIX}'/SimplerOffMenu.kerkus@pm.me'
DST_USER_THEMES=${DST_PREFIX}'/user-theme@gnome-shell-extensions.gcampax.github.com'


message 'Instalación de extensiones de GNOME'

execute "make -C ${SRC_EASY_SCREEN_CAST}" "Configurándo extensión Easy Screen Cast, por favor, espere ..." "Error al configurar la extensión Easy Screen Cast"

execute "make -C ${SRC_SCREENSHOT_TOOL}" "Configurándo extensión Screenshot Tool, por favor, espere ..." "Error al configurar la extensión Screenshot Tool"

execute "make -C ${SRC_DASH_TO_PANEL}" "Configurándo extensión Dash To Panel, por favor, espere ..." "Error al configurar la extensión Dash To Panel"

execute "cp -r ${SRC_CLIPBOARD_INDICATOR}/* ${DST_CLIPBOARD_INDICATOR}" "Instalando extensión Cipboard Indicator, por favor, espere ..." "Error al instalar la extensión Cipboard Indicator"

execute "cp -r ${SRC_SIMPLE_OFF_MENU}/* ${DST_SIMPLE_OFF_MENU}" "Instalando extensión Simpler Off Menu, por favor, espere ..." "Error al instalar la extensión Simpler Off Menu"

execute "cp -r ${SRC_USER_THEMES} ${DST_USER_THEMES}" "Instalando extensión User Theme, por favor, espere ..." "Error al instalar la extensión User Theme"

execute "make install -C ${SRC_EASY_SCREEN_CAST}" "Instalando extensión Easy Screen Cast, por favor, espere ..." "Error al instlar la extensión Easy Screen Cast"

execute "make install -C ${SRC_SCREENSHOT_TOOL}" "Instalando extensión Screenshot Tool, por favor, espere ..." "Error al instalar la extensión Screenshot Tool" && cp -r "${SRC_SCREENSHOT_TOOL}-config"/* "${DST_SCREENSHOT_TOOL}"

execute "make install -C ${SRC_DASH_TO_PANEL}" "Instalando extensión Dash To Panel, por favor, espere ..." "Error al instlar la extensión Dash To Panel"

execute "gnome-extensions enable ${DST_SCREENSHOT_TOOL}" "Inicializando extensión Screenshot Tool, por favor, espere ..." "Error al inicializar la extensión ${SRC_SCREENSHOT_TOOL}"

execute "gnome-extensions enable ${DST_CLIPBOARD_INDICATOR}" "Inicializando extensión Cipboard Indicator, por favor, espere ..." "Error al inicializar la extensión ${SRC_CLIPBOARD_INDICATOR}"

execute "gnome-extensions enable ${DST_DASH_TO_PANEL}" "Inicializando extensión Dash To Panel, por favor, espere ..." "Error al inicializar la extensión Dash To Panel"

execute "gnome-extensions enable ${DST_EASY_SCREEN_CAST}" "Inicializando extensión Easy Screen Cast, por favor, espere ..." "Error al inicializar la extensión Easy Screen Cast"

execute "gnome-extensions enable ${DST_SIMPLE_OFF_MENU}" "Inicializando extensión Simpler Off Menu, por favor, espere ..." "Error al inicializar la extensión Simpler Off Menu"

execute "gnome-extensions enable ${DST_USER_THEMES}" "Inicializando extensión User Theme, por favor, espere ..." "Error al inicializar la extensión User Theme"

success_message 'Instalación de extensiones de GNOME terminada\n'