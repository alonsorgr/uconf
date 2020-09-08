#!/bin/bash
source <(curl -sLo- "https://git.io/Je0t7")

NULL='/dev/null'

CURRENT_OS_VERSION=$(lsb_release -r -s)

REQUIRED_OS_VERSION='20.04'

EXTENSION_NAMESPACE_SCREENSHOT='gnome-shell-screenshot@ttll.de'