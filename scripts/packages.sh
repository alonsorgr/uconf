#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Instalación de paquetes de software

COUNT=$((${REPOSITORIES_COUNT} + ${PACKAGES_COUNT}))

if dpkg -s snapd >/dev/null 2>&1; then
    for snap in ${SNAP_PACKAGES}; do
        message "Eliminando paquete snap ${snap}, espere ..."
        run sudo snap remove ${snap}
        errors "Error al eliminar el paquete snap ${snap}"
    done
    message "Eliminando Snap del sistema, espere ..."
    run sudo apt -y purge snapd
    errors "Error al eliminar Snap del sistema"

    message "Eliminando rastros de Snap del sistema, espere ..."
    run sudo rm -rf ~/snap /var/cache/snapd /var/snap /var/lib/snapd
    errors "Error al eliminar rastros de Snap del sistema"
    
    echo "Package: snapd
Pin: release a=*
Pin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref > ${NULL}
fi

message "Activando repositorio para PostgreSQL, espere ..."
postgresql_sources_list='/etc/apt/sources.list.d/pgdg.list'
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" | sudo tee ${postgresql_sources_list} > ${NULL}
errors "Error al activar el repositorio de PostgreSQL"

message "Importando repositorio para PostgreSQL, espere ..."
curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - &> ${NULL}
errors "Error al importar el repositorio de PostgreSQL"

message "Activando repositorio para AnyDesk, espere ..."
anydesk_sources_list='/etc/apt/sources.list.d/anydesk-stable.list'
echo "deb http://deb.anydesk.com/ all main" | sudo tee ${anydesk_sources_list} > ${NULL}
errors "Error al activar el repositorio de AnyDesk"

message "Importando repositorio para AnyDesk, espere ..."
curl -sL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - &> ${NULL}
errors "Error al importar el repositorio de AnyDesk"

apt_update

bar::start
for repository in ${REPOSITORIES_LIST}; do
    apt_ppa_enable ${repository}
    steps_done_repositories=$((${steps_done_repositories:-0}+1))
    bar::status_changed ${steps_done_repositories} ${COUNT}
done
for package in ${PACKAGES_LIST}; do
    apt_install ${package}
    steps_done_package=$((${steps_done_package:-0}+1))
    bar::status_changed ${steps_done_package} ${COUNT}
done
bar::stop

deb_url_install "${GOOGLE_CHROME_DEB_URL}" "(google-chrome-estable)" "google-chrome-stable"
deb_url_install "${VS_CODE_DEB_URL}" "(visual-studio-code)" "code"
deb_url_install "${WARP_TERMINARL_DEB_URL}" "(warp-terminal)" "warp-terminal"

message "Instalando Node Version Manager (nvm), espere ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh &> ${NULL} | bash &> ${NULL}
errors "Error al instalar Node Version Manager (nvm)"

message "Configurando Node Version Manager, espere ..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
errors "Error al instalar Node Version Manager"

message "Instalando NodeJs versión 20, espere ..."
run nvm install 20
errors "Error al instalar NodeJs versión 20"

message "Descargando Nautilus Open Any Terminal, espere ..."
curl -s https://api.github.com/repos/Stunkymonkey/nautilus-open-any-terminal/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | wget -i - &> ${NULL}
errors "Error al descargar Nautilus Open Any Terminal"

message "Instalando Nautilus Open Any Terminal, espere ..."
run sudo dpkg -i nautilus-extension-any-terminal_*
errors "Error al instalar Nautilus Open Any Terminal"

message "Configurando Nautilus Open Any Terminal, espere ..."
run sudo glib-compile-schemas /usr/share/glib-2.0/schemas
errors "Error al configurar Nautilus Open Any Terminal"

message "Eliminando paquetes residuales de Nautilus Open Any Terminal, espere ..."
run rm -rf *.deb
errors "Error al eliminar los paquetes residuales de Nautilus Open Any Terminal"

message "Instalando Gnome Extensions CLI, espere ..."
run pip3 install --upgrade gnome-extensions-cli --break-system-packages &> ${NULL}
errors "Error al instalar Gnome Extensions CLI,"

if [ -f "${HOME}/.config/autostart/anydesk_global_tray.desktop" ]; then
    message "Eliminando AnyDesk del inicio del sistema para el usuario actual, espere ..."
    run rm -rf ${HOME}/.config/autostart/anydesk_global_tray.desktop
    errors "Error al eliminar AnyDesk del inicio del sistema del usuario actual"
fi

if [ -f "/etc/xdg/autostart/anydesk_global_tray.desktop" ]; then
    message "Eliminando AnyDesk del inicio del sistema, espere ..."
    run sudo rm -rf /etc/xdg/autostart/anydesk_global_tray.desktop
    errors "Error al eliminar AnyDesk del inicio del sistema"
fi

param_postgresql "intervalstyle" "'iso_8601'" ${POSTGRESQL_CONFIG}
param_postgresql "timezone" "'UTC'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_messages" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_monetary" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_numeric" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_time" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "default_text_search_config" "'pg_catalog.english'" ${POSTGRESQL_CONFIG}

apt_update
apt_clean
