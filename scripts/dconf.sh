#!/bin/bash

# Name:Importación de configuración de GNOME

message "\nImportando configuración de GNOME, espere ..."
run dconf load / < "${__DIR__}/config/gnome.cfg"
errors "Error al importar la configuración de GNOME"
