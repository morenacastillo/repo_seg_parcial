#!/bin/bash
clear

LISTA="$HOME/2p_2024/B_BashScript/Lista.txt"
for LINEA in $(cat "$LISTA" | grep -v '^#' | grep -v '^$'); do
    USUARIO=$(echo "$LINEA" | awk -F ':' '{print $1}')
    GRUPO=$(echo "$LINEA" | awk -F ':' '{print $2}')
    DIRECTORIO=$(echo "$LINEA" | awk -F ':' '{print $3}')

    # Crear el grupo si no existe
    if ! grep -q "^$GRUPO:" /etc/group; then
        sudo groupadd "$GRUPO"
    fi

    # Crear el usuario
    sudo useradd -m -s /bin/bash -g "$GRUPO" -d "$DIRECTORIO" "$USUARIO"

    # Asegurarse de que el directorio existe y tenga los permisos adecuados
    if [[ -d "$DIRECTORIO" ]]; then
        sudo chown "$USUARIO:$GRUPO" "$DIRECTORIO"
        sudo chmod 750 "$DIRECTORIO"
    else
        sudo mkdir -p "$DIRECTORIO"
        sudo chown "$USUARIO:$GRUPO" "$DIRECTORIO"
        sudo chmod 750 "$DIRECTORIO"
    fi
done

IFS=$ANT_IFS

echo
echo "Usuarios y grupos creados según la lista."
