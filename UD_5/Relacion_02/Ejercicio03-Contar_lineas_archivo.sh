#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: No se han pasado argumentos."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el archivo $1 no existe."
    exit 1
fi

contar_lineas_codigo() {

    archivo=$1
    cantidad=$(grep -vE '^\s*#|^\s*$' "$archivo" | wc -l)

    echo "La cantidad de lineas en $archivo es/son: $cantidad"
     
}

contar_lineas_codigo "$@"
