#!/bin/bash

crear_discografica() {

    if [ $# -eq 0 ]; then
        echo "Error: No se han pasado nombres de artistas."
        return 1
    fi

    destino="./discografica"


    if [ ! -d "$destino" ]; then
        mkdir discografica
        echo "Carpeta discografica creada."
    fi

    while [ $# -gt 0 ]; do
        useradd -m "$1"
        echo "Carpera del artista $1 creada en $destino."
        shift
    done

}

crear_discografica "$@"