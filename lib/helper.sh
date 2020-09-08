function message() {
    echo -e "\033[0;34m$1\033[0m"
}

function success_message() {
    echo -e "\033[0;32m$1\033[0m"
}

function error_message() {
    echo -e "\033[0;31m$1\033[0m"
}

function check_os_version() {
    if [ ${CURRENT_OS_VERSION} == ${REQUIRED_OS_VERSION} ]; then
        success_message "Versión del sistema operativo correcta.\n"
        echo -e "Iniciando proceso de instalación ...\n"
    else
        error_message 'Versión del sistema operativo incorrecta.'
        echo 'Por favor, compruebe los requisitos de instalación.'
        exit
    fi
}

function get_package_name() {
    local version="($1-v.$(apt-cache show "$1" | grep Version | cut -d: -f2 | tr -d '[:space:]'))"
    echo -e ${version}
}

function call_command() {
    echo -e "$2"
}

function install_package() {
    call_command "sudo apt-get install -y "$1"" "Instalando $(get_package_name "$1"), por favor, espere ..."
    sleep 1
}

function enable_repository() {
    call_command "sudo add-apt-repository -y ppa:"$1"" "Activando repositorio "$1", por favor, espere ..."
    sleep 1
}