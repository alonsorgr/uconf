# Configuración de Ubuntu

Configuración personal del entorno de trabajo para Ubuntu 20.04 LTS

## Requisitos

Instalación limpia de [Ubuntu 20.04 LTS](https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso?_ga=2.189067822.485950335.1599564112-573427031.1599564112)

```sh
$ sudo apt install git
```

---

## Instalación

```sh
$ git clone --recursive https://github.com/alonsorgr/uconf.git ~/.uconf
$ cd ~/.uconf
$ ./setup.sh
```

---

## Ayuda

- Mostrar ayuda: `$ ./setup.sh --help`
- Modo silencioso: `$ ./setup.sh --quiet`
- Explicar lo que se está haciendo: `$ ./setup.sh --debug`

Se pueden utilizar ambas

```sh
$ ./setup.sh --quiet --debug
$ ./setup.sh --debug --quiet
```
***
## Incluye
- Controladores teclado Logitech K290 para configuración de la tecla FN
  - https://github.com/alonsorgr/k290-fnkeyctl
- Tipografías:
  - Fira Code
  - Input Mono
  - Mononoki
  - Nerd Fonts
  - Powerline Fonts
- Tema GTK Plata personalizado
  - https://gitlab.com/tista500/plata-theme
  - Colores:
    - selection='#bfbfbf'
    - accent='#ffffff'
    - suggestion='#cccccc'
- GDM
  - Color de fondo de pantalla='#080808'
  - Desactivado WayLand
- Iconos Papirus
  - https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
- Extensiones GNOME
  - Clipboard Indicator
  - Dash To Panel
  - Easy Screen Cast
  - Screenshot Tool
  - Simpler Off Menu
  - User Themes

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
