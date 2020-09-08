#!/bin/bash
BASE_DIR=$(dirname "$(readlink -f "$0")")

source $BASE_DIR/lib/config.sh
source $BASE_DIR/lib/helper.sh

REPOSITORIES_LIST=$(cat ${BASE_DIR}/config/repositories.cfg)
REPOSITORIES_COUNT=$(echo ${REPOSITORIES_LIST} | wc -w)

DEPENDENCES_LIST=$(cat ${BASE_DIR}/config/dependences.cfg)
DEPENDENCES_COUNT=$(echo ${DEPENDENCES_LIST} | wc -w)

PACKAGES_LIST=$(cat ${BASE_DIR}/config/packages.cfg)
PACKAGES_COUNT=$(echo ${PACKAGES_LIST} | wc -w)

COUNT=$((${DEPENDENCES_COUNT} + ${PACKAGES_COUNT} + ${REPOSITORIES_COUNT}))

install_packages() {
    bar::start
    message 'Activando respositorios ...'
    for repositories in ${REPOSITORIES_LIST}; do
        enable_repository ${repositories}
        steps_done_repositories=$((${steps_done_repositories:-0}+1))
        bar::status_changed ${steps_done_repositories} ${COUNT}
        sleep 1
    done
    success_message "Activación de repositorios terminada.\n"
    message 'Iniciando instalación de dependencias ...'
    for dependence in ${DEPENDENCES_LIST}; do
        install_package ${dependence}
        steps_done_dependence=$((${steps_done_dependence:-0}+1))
        bar::status_changed ${steps_done_dependence} ${COUNT}
        sleep 1
    done
    success_message "Instalación de dependencias terminada.\n"
    message 'Iniciando instalación de paquetes ...'
    for package in ${PACKAGES_LIST}; do
        install_package ${package}
        steps_done_package=$((${steps_done_package:-0}+1))
        bar::status_changed ${steps_done_package} ${COUNT}
        sleep 1
    done
    success_message "Instalación de paquetes terminada.\n"
    bar::stop
}
