#!/bin/bash

crear_usuarios() {

    if [ $# -eq 0 ]; then
        echo "Error: No se han pasado nombres de usuario."
        return 1
    fi
    
    while [ $# -gt 0 ]; do
        useradd -m "$1"
        echo "Creado Usuario $1"
        shift
    done

}

crear_usuarios "$@"