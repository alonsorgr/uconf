#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

# Name:Configuración de Github

_github()
{
    if [ -n "$2" ]
    then
        git config --global github.$1 "$2"
    else
        echo $(git config --global github.$1)
    fi

}

_git_user()
{
    if [ -n "$2" ]
    then
        git config --global user.$1 "$2"
    else
        echo $(git config --global user.$1)
    fi

}

create_github_user()
{
    read -p "Nombre de usuario en GitHub (NO el email): " USUARIO
    if [ -n "$USUARIO" ]; then
        message "Creando configuración github.user ..."
        _github user "$USUARIO"
    fi
}

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global push.default simple

USER_NAME=$(_git_user name)
if [ -n "${USER_NAME}" ]; then
    question SN "Configuración user.name ya creada. ¿Quieres cambiarla?" N 
fi
if [ -z "${USER_NAME}" ] || [ "$SN" = "S" ]; then
    read -p "Nombre completo del programador: " USER_NAME
    if [ -n "${USER_NAME}" ]; then
        message "Creando configuración user.name ..."
        _git_user name "${USER_NAME}"
    fi
fi

USER_EMAIL=$(_git_user email)
if [ -n "${USER_EMAIL}" ]; then
    question SN "Configuración user.email ya creada. ¿Quieres cambiarla?" N 
fi
if [ -z "${USER_EMAIL}" ] || [ "$SN" = "S" ]; then
    read -p "Dirección de correo electrónico asociada: " USER_EMAIL
    if [ -n "${USER_EMAIL}" ]; then
        message "Creando configuración user.email ..."
        _git_user email "${USER_EMAIL}"
    fi
fi

if [ -z "${USER_NAME}" ] || [ -z "${USER_EMAIL}" ]; then
    error_message "Configura el nombre y la dirección de email antes de continuar."
    exit 1
fi

GITHUB_USER=$(_github user)
if [ -n "${GITHUB_USER}" ]; then
    question SN "Configuración github.user ya creada. ¿Quieres cambiarla?" N 
fi
if [ -z "${GITHUB_USER}" ] || [ "$SN" = "S" ]; then
    create_github_user
fi

TOKEN=$(_github token)
if [ -n "${TOKEN}" ]; then
    question SN "Token de GitHub ya creado. ¿Quieres cambiarlo?" N 
fi
if [ -z "${TOKEN}" ] || [ "$SN" = "S" ]; then
    if [ -z "${GITHUB_USER}" ]; then
        message "Para crear el token, debes indicar tu nombre de {GITHUB_USER} en GitHub."
        question "¿Quieres indicarlo ahora?" S 
        if [ "$SN" = "S" ]; then
            create_github_user
        fi
    fi
    if [ -n "${GITHUB_USER}" ]; then
        GENERATE="S"
        while true; do
            if [ "${GENERATE}" = "S" ]; then
                DESC="$(hostname) $(date +%Y-%m-%d\ %H:%M)"
                DESC=$(echo $DESC | tr " " "+")
                URL="https://github.com/settings/tokens/new?scopes=repo,gist&description=${DESC}"
                message "1. Vete a $URL"
                message "2. No cambies nada en esa página"
                message "3. Pulsa directamente en 'Generate token' al final de la página"
                message "4. Copia y pega el token aquí"
                read -p "(Pulsa Entrar para abrir una ventana del navegador en esa dirección.)" _DUMMY
                xdg-open $URL >/dev/null 2>&1
            fi
            while true; do
                read -p "Introduzca el token: " TOKEN
                if [ -n "${TOKEN}" ]; then
                    break
                else
                    error_message "Error, ha introducido un token vacío"
                    question CANCEL "¿Quiere cancelar la generación del token?" S 
                    if [ "${CANCEL}" = "S" ]; then
                        break
                    fi
                fi
            done
            if [ -n "${TOKEN}" ]; then
                message "Creando token de GitHub para git..."
                _github token "${TOKEN}"
                message "Comprobando token, espere ..."
                RES=$(curl -s -X GET -u ${GITHUB_USER}:${TOKEN} https://api.github.com/user | grep '"login"')
                RES=$(echo $RES | cut -d":" -f2 | tr -d '", ')
                if [ "${GITHUB_USER}" = "${RES}" ]; then
                    message "Comprobación correcta"
                    message "** Para que el cambio tenga efecto hay que cerrar la terminal y abrir otra **"
                    break
                else
                    mensaje_error "El token no es correcto"
                    question {GENERATE} "¿Quiere volver a generar el token en GitHub?" N 
                fi
            elif [ "${CANCEL}" = "S" ]; then
                TOKEN=""
                break
            fi
        done
    fi
fi

if [ -n "${TOKEN}" ]; then
    DEST='/usr/local/bin/ghi'
    SN="S"
    if [ -x ${DEST} ]; then
        question SN "Ghi ya instalado. ¿Quieres actualizarlo?" S 
    fi
    if [ "$SN" = "S" ]; then
        message "Instalando ghi en ${DEST}..."
        curl -sL "https://raw.githubusercontent.com/drazisil/ghi/master/ghi" | sudo tee ${DEST} > /dev/null
        sudo chmod a+x ${DEST}
    fi
    message "Asignando parámetro ghi.token, espere ..."
    git config --global ghi.token ${TOKEN}
    DEST='/usr/local/bin/hub'
    SN="S"
    if [ -x ${DEST} ]; then
        question SN "GitHub-hub ya instalado. ¿Quieres actualizarlo?" S 
    fi
    if [ "$SN" = "S" ]; then
        message "Instalando GitHub-hub en ${DEST}, espere ..."
        FILE="hub-linux-amd64-$HUB_VERSION"
        curl -sL "https://github.com/github/hub/releases/download/v$HUB_VERSION/$FILE.tgz" | tar xfz - --strip=2 "$FILE/bin/hub" -O | sudo tee ${DEST} > /dev/null
        sudo chmod a+x ${DEST}
    fi
    message "Asignando parámetro hub.protocol = https, espere ..."
    git config --global hub.protocol https
    DEST=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/hub.zsh
    message "Creando variable de entorno GITHUB_{TOKEN}, espere ..."
    echo "export GITHUB_{TOKEN}=${TOKEN}" > ${DEST}
    DEST=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/jekyll.zsh
    message "Creando variable de entorno JEKYLL_GITHUB_{TOKEN}, espere ..."
    echo "export JEKYLL_GITHUB_{TOKEN}=${TOKEN}" > ${DEST}
fi

if [ -n "${GITHUB_USER}" ] && [ -n "${TOKEN}" ]; then
    message "Creando entradas en ~/.netrc, espere ..."
    [ -f ~/.netrc ] || touch ~/.netrc
    netrc "github.com" ${GITHUB_USER} ${TOKEN}
    netrc "api.github.com" ${GITHUB_USER} ${TOKEN}
fi

disable_sudo "/usr/bin/git"
