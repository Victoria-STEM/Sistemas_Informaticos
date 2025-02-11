#!/bin/bash

concatenar_palabras() {
    
    frase=""

    while [ $# -gt 0 ]; do

        frase+="$1"
        shift

        if [ $# -ge 1 ]; then
            frase+=" - "
            # echo $#
        fi

    done
    echo "$frase"
}

concatenar_palabras "$@"