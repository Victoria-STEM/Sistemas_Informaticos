#!/bin/bash

crear_archivos() {

    if [ $# -eq 0 ]; then
        echo "Error: No se especificaron archivos."
        return 1
    fi

    while [ $# -gt 0 ]; do
        touch "$1"
        echo "Creado Archivo $1"
        shift
    done

}


crear_archivos "$@"