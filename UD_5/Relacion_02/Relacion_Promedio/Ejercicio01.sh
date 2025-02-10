#!/bin/bash

calcular_promedio() {

    suma=0
    contador=$#
    total=0

    while [ $# -gt 0 ]; do
        suma=$((suma + $1))
        shift
    done

    total=$(( suma / contador ))

    mostrar_mensaje "$total"

}

mostrar_mensaje() {
    echo "La media de los argumentos es: $1"
}

calcular_promedio "$@"