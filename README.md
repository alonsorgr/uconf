
# Configuración de Ubuntu
Configuración personal del entorno de trabajo para Ubuntu 20.04 LTS
## Requisitos
 - Instalación limpia de [Ubuntu 20.04 LTS](https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso?_ga=2.189067822.485950335.1599564112-573427031.1599564112)
 - [Git](https://git-scm.com/) installed and configured.
***
## Instalación
```sh
$ git clone --recursive https://github.com/alonsorgr/uconf.git ~/.uconf
$ cd ~/.uconf
$ ./setup.sh
```
***
## Habilitar bloqueo numérico al iniciar sesión
 ```sh
$ sudo -i
$ xhost +SI:localuser:gdm
$ su gdm -s /bin/bash
$ gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state 'on'
```
***
## Habilitar o deshabilitar wayland en Ubuntu 20.04
```sh
$ nano /etc/gdm3/custom.conf
```
- Eliminar comentario en linea: WaylandEnable=false
```sh
$ sudo systemctl restart gdm3
```