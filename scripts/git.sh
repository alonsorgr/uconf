#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración de cuenta de usuario GitHub

read -p "Introduce tu nombre de usuario de GitHub: " github_username
run git config --global user.name "${github_username}"
errors "Error al configurar el nombre de usuario de Git"

run git config --global github.name "${github_username}"
errors "Error al configurar el nombre de usuario de GitHub"

read -p "Introduce tu correo electrónico de Git: " github_email
run git config --global user.email "${github_email}"
errors "Error al configurar el correo electrónico para GitHub"

read -p "Introduce tu Token de Acceso Personal (PAT) de GitHub: " github_token
run git config --global credential.helper store
errors "Error al configurar Token de Acceso Personal (PAT) para GitHub"

git config --global github.token ${github_token}
errors "Error al establecer Token de Acceso Personal (PAT) para GitHub"

echo "https://$github_username:$github_token@github.com" > ~/.git-credentials
