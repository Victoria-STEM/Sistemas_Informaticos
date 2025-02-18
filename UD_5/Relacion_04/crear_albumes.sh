#!/bin/bash

crear_albumes() {

    if [ $# -lt 2 ]; then
        echo "Error: No se ha proporcionado un artista y álbumes."
        return 1
    fi

    carpeta="$1"
    destino="./discografica/$carpeta"

    if [ ! -d "$destino" ]; then
        mkdir -p "./discografica/$carpeta"
        echo "Carpeta $carpeta creada."
    fi

    shift

    while [ $# -gt 0 ]; do
        touch "$destino/$1.txt"
        echo "Album $1.txt creado en $carpeta"
        shift
    done
    
}

crear_albumes "$@"