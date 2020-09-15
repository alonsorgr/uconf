#!/bin/bash

###
# @link https://github.com/alonsorgr/uconf
# @copyright Copyright (c) 2020 alonsorgr
# @license https://raw.githubusercontent.com/alonsorgr/uconf/master/LICENSE?token=AH3YUC7WYRDYPH26XTVMTXK7NHANA
##

src='/usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource'
dst='/usr/local/share/gnome-shell/theme/plata-noir'
prefix='/org/gnome/shell/theme'
color='#080808'

install -D ${NULL} "${dst}/gdm3.css"
install -D ${NULL} "${dst}/plata-noir.gresource.xml"
install -d "${dst}/icons/scalable/actions"

gresource extract "${src}" "${prefix}/checkbox.svg" > "${dst}/checkbox.svg"
gresource extract "${src}" "${prefix}/checkbox-off.svg" > "${dst}/checkbox-off.svg"
gresource extract "${src}" "${prefix}/checkbox-focused.svg" > "${dst}/checkbox-focused.svg"
gresource extract "${src}" "${prefix}/checkbox-off-focused.svg" > "${dst}/checkbox-off-focused.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/pointer-drag-symbolic.svg" > "${dst}/icons/scalable/actions/pointer-drag-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/keyboard-enter-symbolic.svg" > "${dst}/icons/scalable/actions/keyboard-enter-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/keyboard-hide-symbolic.svg" > "${dst}/icons/scalable/actions/keyboard-hide-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/pointer-secondary-click-symbolic.svg" > "${dst}/icons/scalable/actions/pointer-secondary-click-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/keyboard-shift-filled-symbolic.svg" > "${dst}/icons/scalable/actions/keyboard-shift-filled-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg" > "${dst}/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/pointer-primary-click-symbolic.svg" > "${dst}/icons/scalable/actions/pointer-primary-click-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/keyboard-layout-filled-symbolic.svg" > "${dst}/icons/scalable/actions/keyboard-layout-filled-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/eye-not-looking-symbolic.svg" > "${dst}/icons/scalable/actions/eye-not-looking-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/pointer-double-click-symbolic.svg" > "${dst}/icons/scalable/actions/pointer-double-click-symbolic.svg"
gresource extract "${src}" "${prefix}/icons/scalable/actions/eye-open-negative-filled-symbolic.svg "> "${dst}/icons/scalable/actions/eye-open-negative-filled-symbolic.svg"

cp -rf '/usr/share/themes/Plata-Noir/gnome-shell/gnome-shell.css' "${dst}/original.css"
cp -rf '/usr/share/themes/Plata-Noir/gnome-shell/toggle-on.svg' "${dst}/toggle-on.svg"
cp -rf '/usr/share/themes/Plata-Noir/gnome-shell/toggle-off.svg' "${dst}/toggle-off.svg"

echo '@import url("resource:///org/gnome/shell/theme/original.css");
  #lockDialogGroup {
  background: '${color}';
  background-repeat: no-repeat;
  background-size: cover;;
  background-position: center; }' > "${dst}/gdm3.css"

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
    <file>original.css</file>
    <file>gdm3.css</file>
    <file>toggle-off.svg</file>
    <file>checkbox-off.svg</file>
    <file>toggle-on.svg</file>
    <file>checkbox-off-focused.svg</file>
    <file>checkbox-focused.svg</file>
    <file>checkbox.svg</file>
    <file>icons/scalable/actions/pointer-drag-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-enter-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-hide-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-secondary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-shift-filled-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-primary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-layout-filled-symbolic.svg</file>
    <file>icons/scalable/actions/eye-not-looking-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-double-click-symbolic.svg</file>
    <file>icons/scalable/actions/eye-open-negative-filled-symbolic.svg</file>
  </gresource>
</gresources>' > "${dst}/plata-noir.gresource.xml"

cd ${dst}
glib-compile-resources plata-noir.gresource.xml
mv plata-noir.gresource ..
rm -r ${dst}
update-alternatives --quiet --install '/usr/share/gnome-shell/gdm3-theme.gresource' gdm3-theme.gresource '/usr/local/share/gnome-shell/theme/plata-noir.gresource' 0
update-alternatives --quiet --set gdm3-theme.gresource '/usr/local/share/gnome-shell/theme/plata-noir.gresource'