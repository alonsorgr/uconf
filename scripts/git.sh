#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración de cuenta de usuario GitHub

github_username=$(read_data "Introduce tu nombre de usuario de GitHub")
github_email=$(read_data "Introduce tu correo electrónico asociado a tu cuenta en GitHub")
github_token=$(read_data "Introduce tu Token de Acceso Personal (PAT) de GitHub")


if [[ -z "${github_username}" || -z "${github_email}" || -z "${github_token}" ]]; then
    if [[ -z "${github_username}" ]]; then
        message "No se puede vincular tu cuenta de Github con este dispositivo porque no ha introducido su nombre de usuario."
    fi
    if [[ -z "${github_email}" ]]; then
        message "No se puede vincular tu cuenta de Github con este dispositivo porque no ha introducido su correo electrónioco vinculado."
    fi
    if [[ -z "${github_token}" ]]; then
        message "No se puede vincular tu cuenta de Github con este dispositivo porque no ha introducido su Token de Acceso Personal (PAT) de GitHub."
    fi
else
    message "Configurando el almacenamiento de credenciales para Git y Github, espere ..."
    run git config --global credential.helper store
    errors "Error al configurar el almacenamiento de credenciales para Git y Github"

    message "Configurando su nombre de usuario global (Git) en el dispositivo, espere ..."
    run git config --global user.name "${github_username}"
    errors "Error al configurar el nombre de usuario de Git"

    message "Configurando su nombre de usuario de Github en el dispositivo, espere ..."
    run git config --global github.name "${github_username}"
    errors "Error al configurar el nombre de usuario de GitHub"

    message "Configurando su correo electrónico vinculado con Github en el dispositivo, espere ..."
    run git config --global user.email "${github_email}"
    errors "Error al configurar el correo electrónico para GitHub"

    message "Configurando su Token de Acceso Personal (PAT) de GitHub, espere ..."
    git config --global github.token "${github_token}"
    errors "Error al configurar Token de Acceso Personal (PAT) para GitHub"
fi
