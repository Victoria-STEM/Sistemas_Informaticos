#!/bin/bash

# Crea un script en Bash que simule el lanzamiento de dos dados.
# El script debe recibir un número como argumento, indicando cuántas veces se deben lanzar los dados.
# Cada lanzamiento debe imprimir los valores obtenidos en ambos dados y la suma de estos.
# Si no se recibe un argumento válido, el script debe mostrar un mensaje de error.

lanzar_dado() {
    MIN=1
    MAX=6
    echo $(( RANDOM % ( $MAX - $MIN + 1) + $MIN ))
}

comprobacion_argumentos () {

    argumento="$@"

    if [[ ! "$argumento" =~ ^[0-9]+$ ]]; then
        echo "Error. Se debe introducir un numero entero."
        return 1
    fi

}

# -------------------------- MAIN --------------------------

comprobacion_argumentos "$@" || exit 1 

numero="$@"
resultado=0
suma=0

while [ "$numero" -gt 0 ]; do

    dado1=$(lanzar_dado)
    dado2=$(lanzar_dado)
    
    suma=$(( $dado1 + $dado2 ))
    resultado=$(( $resultado + $suma ))
    numero=$(( $numero - 1 ))

done

echo "El resultado de la suma de los dados es: $resultado."