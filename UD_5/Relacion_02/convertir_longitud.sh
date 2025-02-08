#!/bin/bash

# Funcion principal:

convertir_longitud() {
    cantidad=$1
    unidadOrigen=$2
    unidadDestino=$3

    validar=$(validar_argumentos "$@")
    validarUnidad=$(validar_unidaded "$@")
    validarArgumentos=$(validar_argumentos "$@")

    if [ "$validar" = "ok" ]; then # primero validamos el numero de argumentos.

        if [ "$validarUnidad" = "ok" ]; then # segundo validamos las unidades de medida.
            
            if [ "$validarArgumentos" = "ok" ]; then # tercero validamos los numeros.

                if [ "$unidadOrigen" = "m" ] && [ "$unidadDestino" = "km" ]; then
                    resultado=$(metros_a_kilometros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."

                elif [ "$unidadOrigen" = "m" ] && [ "$unidadDestino" = "cm" ]; then
                    resultado=$(metros_a_centimetros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."
                    
                elif [ "$unidadOrigen" = "km" ] && [ "$unidadDestino" = "m" ]; then
                    resultado=$(kilometros_a_metros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."
                    
                elif [ "$unidadOrigen" = "cm" ] && [ "$unidadDestino" = "m" ]; then
                    resultado=$(centimetros_a_metros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."
                    
                elif [ "$unidadOrigen" = "km" ] && [ "$unidadDestino" = "cm" ]; then
                    resultado=$(kilometros_a_centimetros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."
                    
                elif [ "$unidadOrigen" = "cm" ] && [ "$unidadDestino" = "km" ]; then
                    resultado=$(centimetros_a_kilometros "$@")
                    echo "$cantidad $unidadOrigen son $resultado $unidadDestino."
                    
                fi

            else
                echo "$validarArgumentos"
            fi

        else 
            echo "$validarUnidad"
        fi

    else 
        echo "$validar"
    fi

}

# Conversiones:

metros_a_kilometros() {
    cantidad=$1
    solucion=$( cantidad / 1000 | bc -l)
    echo $solucion
}

metros_a_centimetros() {
    cantidad=$1
    solucion=$(( cantidad * 100))
    echo $solucion
}

kilometros_a_metros() {
    cantidad=$1
    solucion=$(( cantidad * 1000 ))
    echo $solucion
}

centimetros_a_metros() {
    cantidad=$1
    solucion=$(( cantidad / 100))
    echo $solucion
}

kilometros_a_centimetros() {
    cantidad=$1
    solucion=$(( cantidad * 100000))
    echo $solucion
}

centimetros_a_kilometros() {
    cantidad=$1
    solucion=$(( cantidad / 100000))
    echo $solucion
}

#Validaciones:

validar_numero() {
    numero=$1
    if [ "$numero" -lt 0 ]; then
        echo "Error: La cantidad debe ser mayor que 0."
    else 
        echo "ok"
    fi
} 

validar_unidaded() {
    unidadOrigen=$2
    unidadDestino=$3

    if [ "$unidadOrigen" = "m" ] || [ "$unidadOrigen" = "km" ] || [ "$unidadOrigen" = "cm" ] && [ "$unidadDestino" = "m" ] || [ "$unidadDestino" = "km" ] || [ "$unidadDestino" = "cm" ]; then
        echo "ok"
    else 
        echo "Unidades invalidas, por favor introduce: m, km o cm."
    fi

}

validar_argumentos() {

    if [ "$#" -ne 3 ]; then
        echo "Numero de argumentos incorrecto: <cantidad> <unidadInicial> <unidadFinal>"
    else 
        echo "ok"
    fi

}

convertir_longitud "$@"
