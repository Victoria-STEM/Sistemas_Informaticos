#!/bin/bash

calcular_area() {

    tipo=$1

    resultado=$(validar_argumentos "$@")
    echo "$resultado"

    if [ "$resultado" = "Todo correcto." ]; then
        echo "Todo super correcto."
    fi

}

area_circulo() {
    radio=$1
    resultado=$(( 3.14 * ( $radio * $radio ) ))
    echo $resultado
}

area_rectangulo() {
    base=$1
    altura=$2

    resultado=$(( $base * $altura ))
    echo $resultado
}

area_triangulo() {
    base=$1
    altura=$2

    resultado=$(( ($base * $altura) / 2 ))
}

validar_argumentos() {
    
    tipo="$1"
    resultado=""

    if [ "$tipo" = "circulo" ] && [ $# -ne 2 ]; then
        echo " Numero insificiente de argumentos."
        return 1

    elif [ "$tipo" = "rectangulo" ] && [ $# -ne 3 ]; then
        echo " Numero insificiente de argumentos."
        return 1

    elif [ "$tipo" = "triangulo" ] && [ $# -ne 3 ]; then
        echo " Numero insificiente de argumentos."
        return 1
    
    elif [ "$tipo" != "circulo" ] && [ "$tipo" != "rectangulo" ] && [ "$tipo" != "triangulo" ]; then
        echo "Argumento incorrecto."
        return 1
    
    else
        resultado="Todo correcto."

    fi

    echo "$resultado"
}

calcular_area "$@"