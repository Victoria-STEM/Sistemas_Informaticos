#!/bin/bash


validar_operador () {
    
    operador="$1"
    
    if [ "$operador" = "+" ] || [ "$operador" = "-" ] || [ "$operador" = "x" ] || [ "$operador" = "/" ]; then
        resultado="Valido"
    else 
        resultado="No valido"
    fi

    echo "$resultado"

}

validar_division_cero () {

    operador="$1"
    numero="$2"
    resultado="Todo correcto"

    if [ "$operador" = "/" ] && [ "$numero" = 0 ]; then 
        mensaje="error"
    fi
    
    echo "$resultado"

}

operar () {

    numero1="$1"
    operador="$2"
    numero2="$3"

    resultado=$((numero1 $operador numero2))

    echo "$resultado"

}

calculadora() {

    operar "$1" "$2" "$3"
    operar "$resultado" "$4" "$5"
    
    echo "Calculadora: $1 $2 $3 es $resultado"
}

calculadora "$@"
validar_operador "$2" "$4"
validar_division_cero "" ""

