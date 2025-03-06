#!/bin/bash

concatenar_palabras() {
    
    if [ $# -lt 1 ]; then
        echo "Argumentos insuficientes."
        return 1
    fi

    resultado=""
    while [ $# -gt 0 ]; do
        resultado+="$1 - "
        shift    
    done
    echo $resultado
    
}

# ----------------------------- MAIN -----------------------------

concatenar_palabras "$@"
