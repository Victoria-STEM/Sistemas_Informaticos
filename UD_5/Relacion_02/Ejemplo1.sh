#!/bin/bash

multiplicar_numeros_y_restar_el_ultimo() {

    total=$1
    shift
    
    while [ $# -gt 0 ]; do

        if [ $# -gt 1 ]; then
            total=$(( total * $1 ))
            shift
        else 
            total=$(( total - $1 ))
            shift
        fi

    done
    echo "La cifra total es: $total."

}

multiplicar_numeros_y_restar_el_ultimo 5 10