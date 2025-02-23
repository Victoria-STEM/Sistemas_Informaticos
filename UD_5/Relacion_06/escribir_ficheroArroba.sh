#!/bin/bash

# Haz un script que reciba como primer argumento el nombre de
# un fichero y escriba el resto de argumentos en el fichero
# La primera línea del fichero debe ser el número de filas escritas

ercribir_en_fichero() {
    
    if [ -z "$@" ]; then
        echo "No se ha proporcionado ningun archivo."
        return 1
    fi

    if [ $# -lt 2 ]; then
        echo "No se han pasaso texto a escribir en el archivo $1"
        return 1
    else 

        fichero="$1.txt"
        touch "$fichero"
        shift

        numeroFilas=$#
        echo "Numero de filas: $numeroFilas" >> "$fichero"

        while [ "$#" -gt 0 ]; do
            echo "$1" >> "$fichero"
            shift
        done

    fi

}

# ------------------- MAIN -------------------

ercribir_en_fichero "$@"