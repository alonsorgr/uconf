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
Pin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref > /dev/null
fi

message "Agregando clave de repositorio para GitHub CLI, espere ..."
run curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
errors "Error al agregar la clave de repositorio para GitHub CLI"

message "Activando repositorio para GitHub CLI, espere ..."
run echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
errors "Error al activar el repositorio de GitHub CLI"

message "Activando repositorio para PostgreSQL, espere ..."
postgresql_sources_list='/etc/apt/sources.list.d/pgdg.list'
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" | sudo tee ${postgresql_sources_list} > /dev/null
errors "Error al activar el repositorio de PostgreSQL"

message "Importando repositorio para PostgreSQL, espere ..."
run curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
errors "Error al importar el repositorio de PostgreSQL"

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

apt_install postgresql-${POSTGRESQL_VERSION}
apt_install postgresql-client-${POSTGRESQL_VERSION}

param_postgresql "intervalstyle" "'iso_8601'" ${POSTGRESQL_CONFIG}
param_postgresql "timezone" "'UTC'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_messages" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_monetary" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_numeric" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "lc_time" "'en_US.UTF-8'" ${POSTGRESQL_CONFIG}
param_postgresql "default_text_search_config" "'pg_catalog.english'" ${POSTGRESQL_CONFIG}

apt_clean
