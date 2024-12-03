#!/bin/bash
clear

LISTA=$1
USUARIO_CLAVE=$2

CLAVE=$(sudo grep "$USUARIO_CLAVE" /etc/shadow | awk -F ':' '{print $2}')


for LINEA in $(cat "$LISTA" | grep -v '^#' | grep -v '^$'); do
    USUARIO=$(echo "$LINEA" | awk -F ':' '{print $1}')
    GRUPO=$(echo "$LINEA" | awk -F ':' '{print $2}')
    DIRECTORIO=$(echo "$LINEA" | awk -F ':' '{print $3}')

    # Crear el grupo si no existe
    if ! grep -q "^$GRUPO:" /etc/group; then
        sudo groupadd "$GRUPO"
    fi

    # Crear el usuario
    sudo useradd -m -s /bin/bash -g "$GRUPO" -d "$DIRECTORIO" -p "$CLAVE" "$USUARIO"

done

IFS=$ANT_IFS

echo
echo "Usuarios y grupos creados según la lista."
