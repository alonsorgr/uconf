#!/bin/bash

# Name:Instalación de paquetes de software

COUNT=$((${REPOSITORIES_COUNT} + ${PACKAGES_COUNT}))

apt_update

if dpkg -s snapd >/dev/null 2>&1; then
    for snap in ${SNAP_PACKAGES}; do
        message "Eliminando paquete snap ${snap}, espere ..."
        run sudo snap remove ${snap}
        errors "Error al eliminar el paquete snap ${snap}"
    done
    message "Eliminando Snap del sistema, espere ..."
    run sudo apt -y purge snapd
    errors "Error al eliminar Snap del sistema"
fi

message "Agregando clave de repositorio para GitHub CLI, espere ..."
run sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key ${GITHUB_CLI_KEY}
errors "Error al agregar la clave de repositorio para GitHub CLI"

message "Activando repositorio para GitHub CLI, espere ..."
run sudo apt-add-repository -y -u ${GITHUB_CLI_URL}
errors "Error al activar el repositorio de GitHub CLI"

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

deb_url_install "${GOOGLE_CHROME_DEB}" "(google-chrome-estable)" google-chrome-estable
deb_url_install "${VS_CODE_DEB}" "(visual-studio-code)" code

message "Instalando extensión settings sync, espere ..."
run code --install-extension Shan.code-settings-sync
errors "Error al instalar la extension settings sync"

apt_clean
