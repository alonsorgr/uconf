#!/bin/bash

# Name:Instalación de paquetes APT

SNAP_PACKAGES='snap-store gtk-common-themes gnome-3-34-1804 core18'

REPOSITORIES_LIST=$(cat ${BASE_DIR}/config/repositories.cfg)
REPOSITORIES_COUNT=$(echo ${REPOSITORIES_LIST} | wc -w)

PACKAGES_LIST=$(cat ${BASE_DIR}/config/packages.cfg)
PACKAGES_COUNT=$(echo ${PACKAGES_LIST} | wc -w)

COUNT=$((${REPOSITORIES_COUNT} + ${PACKAGES_COUNT}))

GOOGLE_CHROME_DEB='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
VS_CODE_DEB='https://update.code.visualstudio.com/latest/linux-deb-x64/stable'

message 'Actualizando paquetes instalados en el sistema'

apt_update

success_message 'Actualización de de paquetes terminada\n'

if dpkg -s snapd >/dev/null 2>&1; then
    message 'Eliminar Snap del sistema'

    for snap in ${SNAP_PACKAGES}; do
        execute "sudo snap remove ${snap}" "Eliminando ${snap}, espere ..." "Error al eliminar el paquete ${snap}"
    done

    execute "sudo apt -y purge snapd" "Eliminando snap del sistema, espere ..." "Error al eliminar snap del sistema"

    success_message 'Eliminación de Snap terminada\n'
fi

message 'Iniciando instalación de paquetes'

bar::start
for repository in ${REPOSITORIES_LIST}; do
    enable_repository ${repository}
    steps_done_repositories=$((${steps_done_repositories:-0}+1))
    bar::status_changed ${steps_done_repositories} ${COUNT}
done
for package in ${PACKAGES_LIST}; do
    install_package ${package}
    steps_done_package=$((${steps_done_package:-0}+1))
    bar::status_changed ${steps_done_package} ${COUNT}
done
bar::stop
success_message 'Instalación de de paquetes terminada\n'

message 'Instalación de Google Chrome'

temp="$(mktemp)"
execute "curl -sL -o ${temp} ${GOOGLE_CHROME_DEB}" "Descargando google chrome estable, espere ..." "Error al descargar google chrome estable"
execute "sudo dpkg -i ${temp}" "Instalando google chrome estable, espere ..." "Error al instalar google chrome estable"
execute "rm -f ${temp}" "Eliminando archivos temporales, espere ..." "Error al eliminar archivos temporales google chrome estable"
rm -rf ${temp} &> ${NULL}

success_message 'Instalación de Google Chrome terminada\n'

message 'Instalación de Visual Studio Code'

temp="$(mktemp)"
execute "curl -sL -o ${temp} ${VS_CODE_DEB}" "Descargando visual studio code, espere ..." "Error al descargar visual studio code"
execute "sudo dpkg -i ${temp}" "Instalando visual studio code, espere ..." "Error al instalar visual studio code"
execute "rm -f ${temp}" "Eliminando archivos temporales, espere ..." "Error al eliminar archivos temporales visual studio code"
execute "code --install-extension Shan.code-settings-sync" "Instalando extensión settings sync, espere ..." "Error al instalar la extension settings sync"
rm -rf ${temp} &> ${NULL}

success_message 'Instalación de visual studio code terminada\n'

message 'Eliminando paquetes obsoletos del sistema'

apt_clean

success_message 'Eliminación de paquetes obsoletos terminada\n'