#!/bin/bash

mover_archivos() {

    if [ $# -eq 0 ]; then
        echo "Error: No se especificaron archivos o carpeta destino."
        return 1
    fi
    
    destino="${@: -1}"

    while [ $# -gt 1 ]; do

        if [ -f "$1" ]; then
            mv "$1" "$destino"
            echo "Archivo: $1 movido a $destino"
        else
            echo "Error: $1 no existe."
        fi
        shift
    done

}

mover_archivos "$@"