#!/bin/bash

calcular_area() {

    tipo=$1
    dato1=$2
    dato2=$3

    resultado=$(validar_argumentos "$@")

    if [ "$resultado" = "Todo correcto." ]; then

        if [ "$tipo" = "circulo" ]; then
            solucion=$(area_circulo "$tipo" "$dato1")
            echo "El area del ciruclo es: $solucion"

        elif [ "$tipo" = "rectangulo" ]; then
            solucion=$(area_rectangulo "$tipo" "$dato1" "$dato2")
            echo "El area del rectangulo es: $solucion"

        elif [ "$tipo" = "triangulo" ]; then
            solucion=$(area_triangulo "$tipo" "$dato1" "$dato2")
            echo "El area del triangulo es: $solucion"

        fi

    fi

}

area_circulo() {
    radio=$2
    resultado=$(( 3,14 * ( radio * radio ) ))
    echo $resultado
}

area_rectangulo() {
    base=$2
    altura=$3

    resultado=$(( base * altura ))
    echo $resultado
}

area_triangulo() {
    base=$2
    altura=$3

    resultado=$(( base * altura / 2 ))
    echo $resultado
}

validar_argumentos() {
    
    tipo="$1"
    resultado=""

    if [ "$tipo" = "circulo" ] && [ $# -ne 2 ]; then
        echo " Numero insuficiente de argumentos."
        return 1

    elif [ "$tipo" = "rectangulo" ] && [ $# -ne 3 ]; then
        echo " Numero insuficiente de argumentos."
        return 1

    elif [ "$tipo" = "triangulo" ] && [ $# -ne 3 ]; then
        echo " Numero insuficiente de argumentos."
        return 1
    
    elif [ "$tipo" != "circulo" ] && [ "$tipo" != "rectangulo" ] && [ "$tipo" != "triangulo" ]; then
        echo "Argumento incorrecto: <tipo> <dato> <dato>."
        return 1
    
    else
        resultado="Todo correcto."

    fi

    echo "$resultado"
}

calcular_area "$@"
