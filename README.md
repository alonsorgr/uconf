# Configuración de Ubuntu

Configuración personal del entorno de trabajo para Ubuntu 24.04.1 LTS

## Requisitos

- Instalación sin modificaciones de [Ubuntu 24.04.1 LTS](https://releases.ubuntu.com/noble/ubuntu-24.04.1-desktop-amd64.iso)

- Sistema de control de versiones Git

```
sudo apt install git
```
***
## Instalación

```
git clone --recursive https://github.com/alonsorgr/uconf.git ~/.uconf
```
```
cd ~/.uconf
```
```
./setup.sh
```
***
## Ayuda

```
OPCIONES:

--help      Muestra la ayuda
--yes       Instalación automatizada (ejecuta todos los scripts sin preguntar al usuario)
--verbose   Muestra la salida en forma detallada por pantalla
--exit      Si hay un error, pregunta al usuario si desea seguir con la instalación 

```

### Ejemplo

```
./setup.sh --yes --verbose --exit
```

## Incluye

- ### Paquetes de software

  - anydesk
  - autoconf
  - automake
  - bat
  - build-essential
  - celluloid
  - command-not-found
  - dconf-editor
  - easytag
  - ffmpeg
  - ffmpegthumbnailer
  - file-roller
  - filezilla
  - findutils
  - fonts-firacode
  - fonts-freefont-ttf
  - fonts-powerline
  - fonts-roboto
  - gdm-settings
  - gettext
  - gimp
  - glade
  - gnome-boxes
  - gnome-shell-extensions
  - gnome-themes-extra
  - gnome-tweak-tool
  - gparted
  - gtk2-engines-murrine
  - inkscape
  - jq
  - libgdk-pixbuf2.0-dev
  - libglib2.0-dev
  - libglib2.0-dev-bin
  - libgtk-3-dev
  - libmarco-dev
  - libnotify-bin
  - libusb-1.0-0-dev
  - libxml2-utils
  - lsd
  - nodejs
  - oh-my-zsh
  - papirus-folders
  - papirus-icon-theme
  - pkg-config
  - postgresql-17
  - postgresql-client-17
  - py3status
  - python3
  - rhythmbox
  - sassc
  - sqlite3
  - synaptic
  - ttf-ancient-fonts
  - tree
  - unrar
  - unzip
  - usb-creator-gtk
  - zsh
  
- ### Navegador
    - [Google Chrome](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)

- ### Editor de código
    - [Visual Studio Code](https://update.code.visualstudio.com/latest/linux-deb-x64/stable)

- ### Tema GTK personalizado (Gnome-shell version = 46.0)
  - [Material Monokai Metallian](https://github.com/alonsorgr/material-monokai-metallian)
- ### Iconos Papirus
  - [Papirus Icons Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

- ### Extensiones GNOME
  - ℹ️ La instalación de las extensiones de Gnome están administradas por [Gnome Extensions CLI](https://github.com/essembeh/gnome-extensions-cli)
  
    - [Alt-Tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)
    - [Color Picker](https://extensions.gnome.org/extension/3396/color-picker/)
    - [Dash To Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
    - [Date Menu Formatter](https://extensions.gnome.org/extension/4655/date-menu-formatter/)
    - [LAN IP Address](https://extensions.gnome.org/extension/1762/lan-ip-address/)
    - [IP Finder](https://extensions.gnome.org/extension/2983/ip-finder/)
    - [No Overview](https://extensions.gnome.org/extension/4099/no-overview/)
    - [Quick Settings Tweaker](https://extensions.gnome.org/extension/5446/quick-settings-tweaker)
    - [User Avatar in Quick Settings](https://extensions.gnome.org/extension/5506/user-avatar-in-quick-settings/)


- ### Terminal
  - Confiiguración de Oh My Zsh
  - Powerlevel10k
  - Zsh Syntax Highlighting
  - Zsh Bat
---

## Consejos

### Aplicar apariencia del tema Material Monokai Metallian en pantalla de iniccio de sesión (GDM)

- Abrir ajustes GDM
- Comprobar que en apariencia esté seleccionado el tema Material Monokai Metallian
- Combrobar que en la configuración de fondo esté configurado para el color `#15181f`
- Aplicar cambios

### Habilitar bloqueo numérico al iniciar sesión

```
sudo -i
```
```
xhost +SI:localuser:gdm
```
```
su gdm -s /bin/bash
```
```
gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state 'on'
```

### Habilitar o deshabilitar wayland en Ubuntu 24.04.1

```
nano /etc/gdm3/custom.conf #WaylandEnable=false
```
