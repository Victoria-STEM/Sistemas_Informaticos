#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: No se han pasado argumentos."
    return 1
fi

calculadora() {

    numero1="$1"
    operador="$2"
    numero2="$3"

    if [ "$operador" = "+" ]; then
        resultado=$(( $1 + $3 ))
        
    elif [ "$operador" = "-" ]; then
        resultado=$(( $1 - $3 ))  

    elif [ "$operador" = "x" ]; then
        resultado=$(( $1 * $3 ))
        
    elif [ "$operador" = "/" ]; then
        resultado=$(( $1 / $3 ))
       
    else 
        echo "Operador erroneo."
    fi

    echo "Calculadora: $1 $2 $3 es $resultado"
}

calculadora "$1" "$2" "$3"