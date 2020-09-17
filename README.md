# Configuración de Ubuntu

Configuración personal del entorno de trabajo para Ubuntu 20.04 LTS

## Requisitos

Instalación limpia de [Ubuntu 20.04 LTS](https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso?_ga=2.189067822.485950335.1599564112-573427031.1599564112)

```sh
$ sudo apt install git
```
***
## Instalación

```sh
$ git clone --recursive https://github.com/alonsorgr/uconf.git ~/.uconf
$ cd ~/.uconf
$ ./setup.sh
```
***
## Ayuda

```sh
$ ./setup.sh --help # Muestra la ayuda
```
```sh
$ ./setup.sh --yes # Sí automático a las indicaciones
```
```sh
$ ./setup.sh --verbose # Explicar lo que se está haciendo
```
```sh
$ ./setup.sh --exit # Pregunta si desea seguir con el script si ocurre un error
```

Se pueden combinar los parámetros

```sh
$ ./setup.sh --yes --verbose --exit
$ ./setup.sh --exit --verbose --yes
```
***
## Incluye
- ### Script de personalización de [ricpelo/conf](https://github.com/ricpelo/conf)
  - Información sobre el script de ```ricpelo/conf``` en [README.md](https://github.com/ricpelo/conf/blob/master/README.md)
  - Se eliminan paquetes innecesarios para mi configuración
  - Se inicializa el script de GitHub al final de la instalación de este script

- ### Controladores teclado Logitech K290 para configuración de la tecla FN
  - https://github.com/alonsorgr/k290-fnkeyctl


- ### Tema GTK Plata personalizado
  - https://gitlab.com/tista500/plata-theme
  - Colores:
    - ```selection='#bfbfbf'```
    - ```accent='#ffffff'```
    - ```suggestion='#cccccc'```
- ### GDM
  - Color de fondo de pantalla=```'#080808'```
  - Desactivado WayLand

- ### Iconos Papirus
  - https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

- ### Extensiones GNOME
  - [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
  - [Dash To Panel](https://github.com/home-sweet-gnome/dash-to-panel)
  - [Easy Screen Cast](https://github.com/EasyScreenCast/EasyScreenCast)
  - [Screenshot Tool](https://github.com/OttoAllmendinger/gnome-shell-screenshot)
  - [Simpler Off Menu](https://gitlab.com/K3rcus/simpler-off-menu)
  - [User Themes](https://gitlab.gnome.org/GNOME/gnome-shell-extensions)

- ### Terminal
  - Configuración de Sakura
  - Confiiguración de Oh-My-Zsh
---

## Consejos

### Habilitar bloqueo numérico al iniciar sesión

```sh
$ sudo -i
$ xhost +SI:localuser:gdm
$ su gdm -s /bin/bash
$ gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state 'on'
```

### Habilitar o deshabilitar wayland en Ubuntu 20.04

```sh
$ nano /etc/gdm3/custom.conf #WaylandEnable=false
```
