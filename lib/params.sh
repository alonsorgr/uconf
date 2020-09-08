#!/bin/bash

NULL='/dev/null'

CURRENT_OS_VERSION=$(lsb_release -r -s)

REQUIRED_OS_VERSION='20.04'


EXTENSION_NAMESPACE_PREFIX=$USER'/.local/share/gnome-shell/extensions/'

EXTENSION_NAMESPACE_SCREENSHOT_TOOL='gnome-shell-screenshot@ttll.de'
EXTENSION_NAMESPACE_CLIPBOARD_INDICATOR='clipboard-indicator@tudmotu.com'
EXTENSION_NAMESPACE_DASH_TO_PANEL='dash-to-panel@jderose9.github.com'
EXTENSION_NAMESPACE_EASY_SCREEN_CAST='EasyScreenCast@iacopodeenosee.gmail.com'
EXTENSION_NAMESPACE_SPEED_METER='InternetSpeedMeter@alshakib.dev'
EXTENSION_NAMESPACE_SIMPLE_OF_MENU='SimplerOffMenu.kerkus@pm.me'
EXTENSION_NAMESPACE_USER_THEMES='user-theme@gnome-shell-extensions.gcampax.github.com'
EXTENSION_NAMESPACE_DESKTOP_ICONS='desktop-icons@csoriano'


EXTENSION_SRC_PREFIX=${BASE_DIR}'/gnome/extensions/'

EXTENSION_SRC_MODULE_SCREENSHOT_TOOL='screenshot'
EXTENSION_SRC_MODULE_CLIPBOARD_INDICATOR='clipboard-indicator'
EXTENSION_SRC_MODULE_DASH_TO_PANEL='dash-to-panel'
EXTENSION_SRC_MODULE_EASY_SCREEN_CAST='easy-screen-cast'
EXTENSION_SRC_MODULE_SPEED_METER='speed-meter'
EXTENSION_SRC_MODULE_SIMPLE_OF_MENU='simple-off-menu'
EXTENSION_SRC_MODULE_USER_THEMES='gnome-shell-extensions/extensions/user-theme'
EXTENSION_SRC_MODULE_DESKTOP_ICONS='desktop-icons'