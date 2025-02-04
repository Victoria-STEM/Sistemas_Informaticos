#!/bin/bash

convertir_temperatura() {

    temperatura=$1
    unidad=$2

    echo "La temperatura es: $1"
    echo "A convertir en: $2"

    if [ "$2" = "C" ]; then
    resultado=$(( (( $1 - 32 ) * 5) / 9 ))  
    echo "$1 F equivale a $resultado C"
    
    elif [ "$2" = "F" ]; then
    resultado=$(( ($1 * 9/5) + 32 ))
    echo "$1 C equivale a $resultado F" 

    fi
}

convertir_temperatura "$@"
