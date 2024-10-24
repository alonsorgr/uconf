#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

function message()
###
#   Muestra un mensaje.
#   @param $1     Texto que se mostrará en el mensaje. 
{
    echo -e "$1"
}

function message_n()
###
#   Muestra un mensaje con salto de línea.
#   @param $1     Texto que se mostrará en el mensaje. 
{
    echo -en "$1"
}

function information_message()
###
#   Muestra un mensaje formateado en negrita de color azul.
#   @param $1     Texto que se mostrará en el mensaje.
{
    echo -e "\033[1;34m$1\033[0m"
}

function success_message()
###
#   Muestra un mensaje formateado en negrita de color verde.
#   @param $1     Texto que se mostrará en el mensaje.
{
    echo -e "\033[1;32m$1\033[0m"
}

function error_message()
###
#   Muestra un mensaje formateado en negrita de color rojo.
#   @param $1     Texto que se mostrará en el mensaje.
{
    echo -e "\033[1;31m\033[5;31m$1\033[0m"
}

function yes_no_message()
###
#   Formula una pregunta en forma de mensaje de sí o no.
#   @param $1     Comando que se ejecutará en caso de afirmativo.
#   @param $2     Texto que se mostrará en el mensaje.
#   @param $3     Sí automático a las indicaciones; asumir "sí" como respuesta.
{
    if [[ "${yes}" == '-y' ]]; then
        $1
    else
        while true; do
            read -p "$2" result
            case ${result} in
                [Ss]* ) $1; break;;
                [Nn]* ) break;;
                * ) echo "Por favor, conteste sí o no (S/n)";;
            esac
        done
    fi
}

function errors()
###
#   Comprueba si ocurrió algún error al ejecutar el comando enterior.
#   @param $1     Texto que se mostrará en el mensaje de error y en el log.
{
    if [ $? -ne 0 ]; then
        echo -e "$1" >> "${__DIR__}/log"
        error_message "$1"
        if [ "${exit}" == '--exit' ]; then
            yes_no_message exit "$(message "Ocurrió un error inesperado. \n¿Desea cancelar la instalación y salir? (S/n): ")"
        fi
    fi
}

function clear_log()
##
#   Elimina el fichero log de la instalación anterior.
{
    rm -rf "${__DIR__}/log"
}

function run()
###
#   Ejecuta un comando y comprueba el estado de la salida.
#   @param $1     Comando de la shell.
{
    if [ "${verbose}" == "--verbose" ]; then
        $@
    else
        $@ &> ${NULL}
    fi
}

function apt_info()
###
#   Devuelve información de un paquete de instalación APT.
#   @param $1   Nombre del paquete.
{
    message "($1-v.$(apt-cache show "$1" 2> ${NULL}| grep Version | cut -d: -f2 | tr -d '[:space:]'))"
}

function apt_install()
###
#   Instala un paquete APT.
#   @param $1 Paquete a instalar por APT.
{
    info="$(apt_info "$1")"
    if ! dpkg -s $1 >${NULL} 2>&1; then
        message "Instalando ${info}, espere ..."
        run sudo apt-get -y install "$1"
        errors "Error al instalar el paquete ${info}"
    else
        message "Paquete ${info} ya instalado ..."
    fi
}

function apt_ppa_enable()
###
#   Activa un reposotorio de APT.
#   @param $1   Nombre del reposiyorio PPA.
{
    if ! grep -q "$1" /etc/apt/sources.list; then
        message "Activando repositorio "$1", espere ..."
        run sudo add-apt-repository -y ppa:"$1" 
        errors "Error al activar el repositorio "$1"."
    else
        message "Repositorio $1 ya activado ..."
    fi
}

function deb_url_install()
###
#   Instala un paquete deb desde una url.
#   @param $1   Url del paquete deb.
{
    if ! dpkg -s "$3" >${NULL} 2>&1; then
        local temp="$(mktemp)"
        message "Descargando paquete deb $2, espere ..."
        run curl -sL -o ${temp} $1
        errors "Error al descargar el paquete deb $2"
        message "Instalando paquete deb $2, espere ..."
        run sudo dpkg -i ${temp}
        errors "Error al instalar el paquete deb $2"
        message "Eliminando archivos temporales, espere ..."
        run rm -rf ${temp} &> ${NULL}
        errors "Error al eliminar archivos temporales"
    else
        message "Paquete $2 ya instalado ..."
    fi
}

function apt_update()
###
#   Actualiza e instala paquetes del sistema.
{
    message "Actualizando la lista de paquetes instalados, espere ..."
    run sudo apt-get -y update &> ${NULL}
    errors "Error al actualizar la lista de paquetes instalados"
    message "Actualizando paquetes instalados, espere ..."
    run sudo apt-get -y upgrade &> ${NULL}
    errors "Error al actualizar los paquetes instalados"
}

function apt_clean() 
###
#   Elimina paquetes obsoletos del sistema y purga el sistema.
{
    message "Eliminando paquetes innecesarios, espere ..."
    run sudo apt-get -y autoremove
    errors "Error al eliminar paquetes innecesarios"
    message "Limpiando el sistema de paquetes obsoletos, espere ..."
    run sudo apt-get -y autoclean
    errors "Error al limpiar el sistema de paquetes obsoletos"
}

function check_directory()
##
#   Comprueba si el script se ejecuta desde el directorio base
{
    if [ "${__DIR__}" != "${PWD}" ]; then
        error_message "Error: debe ejecutar el script desde el directorio ${__DIR__}"
    exit 1
fi
}

function git_module_update()
###
#   Actualiza los módulos git.
{
    message "Actualizando múdulos de git, espere ...\n"
    run git submodule update --init --recursive
    errors "Error al actualizar los módulos de git"
}

function script_name()
###
#   Devuelve el nombre del script definido en un comentario.
{
    cat "$1" | grep Name: | cut -d ':' -f2
}

function backup_and_link()
###
#   Devuelve el nombre del script definido en una variable.
#   @param $1   Archivo de configuración para crear la copia de seguridad y el enlace simbólico.
#   @param $2   Extensión de la copia de seguridad y el enlace simbólico. 
{
    if [ -n "$2" ]; then
        local file=$HOME/$2/$1
    else
        local file=$HOME/$1
    fi
    if [ -e ${file} ]; then
        if [ ! -e ${file}.old ]; then
            if [ "$(realpath $PWD/config/$1)" != "$(realpath ${file})" ]; then
                mv -f ${file} ${file}.old
            fi
        fi
        rm -rf ${file}
    fi
    local path=$(realpath -s --relative-to=${HOME}/$2 $PWD/config/$1)
    ln -sf ${path} ${file}
}

function param_postgresql()
###
#   CAsigna un valor a un parámetro de configuración de PostgreSQL
#   @param $1   Clave del parámetro.
#   @param $2   Valor del parámetro.
#   @param $3   Archivo de configuración.
{
    psqlparam="$1 = $2"
    if ! grep -qs "^$psqlparam" $3
    then
        message "Estableciendo parámetro para PostgreSQL, espere ..."
        #run sudo sed -r -i "s/^\s*#?$1\s*=/$psqlparam #/" $3
        sudo sed -r -i "s|^\s*#?$1\s*=|$psqlparam #|" "$3"
        errors "Error al establecer el parámetro ${psqlparam}"
    else
        message "Parámetro para PostgreSQL ya establecido"
    fi
}

function clone() 
###
#   Clona un repositorio.
#   @param $1   Url del repositorio.
#   @param $2   Destino del clonado del repositorio.
#   @param $3   Nombre del repositorio.
{
    message "Eliminando el repositorio anterior de $3, espere ..."
    [ -d "$2" ] && run rm -rf "$2"
    
    message "Clonando repositorio $3, espere ..."
    run git clone --recursive "$1" "$2"
    errors "Error al clonar el repositorio $3"
}