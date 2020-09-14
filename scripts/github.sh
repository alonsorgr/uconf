#!/bin/bash

# Name:Configuración de GitHub

message 'Configuración de GitHub'

TOKEN_URL='https://github.com/settings/tokens/new?scopes=repo,gist&description'

function _config()
{
    echo -e "Configurándo alias 'lg', espere ..."
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" &> ${NULL}
    check_errors "Error al configurar el alias 'lg'"
    execute "git config --global push.default simple " "Configurándo push, espere ..." "Error al configurar push"   
}

function _name()
{
    read -p "Introduzca su nombre: " name
    if [ -n "${name}" ]; then
        execute "git config --global user.name ${name}" "Creando configuración user.name, espere ..." "Error al configurar user.name"
        question "_name" "El nombre de la configuración de GitHub es: ${name}, ¿Desea cambiarlo? (S/n) "
    else
        error_message "No ha introducido los datos solicitados, ejecute el script de nuevo"
        exit 1
    fi
}

function _user()
{
    read -p "Introduzca su nombre de usuario en GitHub: " user
    if [ -n "${user}" ]; then
        execute "git config --global github.user ${user}" "Creando configuración github.user, espere ..." "Error al configurar github.user"
        question "_user" "El nombre de usuario de la configuración de GitHub es: ${user}, ¿Desea cambiarlo? (S/n) "
    else
        error_message "No ha introducido los datos solicitados, ejecute el script de nuevo"
        exit 1
    fi
}

function _email()
{
    read -p "Introduzca su dirección de correo electrónico de GitHub: " email
    if [ -n "${email}" ]; then
        execute "git config --global user.email ${email}" "Creando configuración user.email, espere ..." "Error al configurar user.email"
        question "_email" "El correo electrónico de la configuración de GitHub es: ${email}, ¿Desea cambiarlo? (S/n) "
    else
        error_message "No ha introducido los datos solicitados, ejecute el script de nuevo"
        exit 1
    fi
}

function _token()
{
    local description="$(hostname) $(date +%Y-%m-%d\ %H:%M)"
    description=$(echo ${description} | tr " " "+")
    echo -e "   1 - Abre el navegador y ve a la siguiente dirección web:\n${TOKEN_URL}=${description}"
    echo -e "   2 - No cambiar ninguna configuración de la dirección web"
    echo -e "   3 - Pulsa directamente en 'Generate token' al final de la página"
    echo -e "   4 - Copia y pega el token aqui"
    read -p "(Pulsa Entrar para abrir una ventana del navegador en esa dirección.)" _DUMMY
    xdg-open ${TOKEN_URL}=${description} >/dev/null 2>&1
    while true; do
        read -p "Introduzca el token: " token
        if [ -n "${token}" ]; then
            break
        fi
    done
    execute "git config --global github.token ${token}" "Creando configuración github.token, espere ..." "Error al configurar github.token"
    question "_token" "El token de la configuración de GitHub es: ${token}, ¿Desea cambiarlo? (S/n) "
}

_config && _name && _user && _email && _token

success_message 'Configuración de GitHub terminada\n'