#!/bin/bash

contar_palabras() {

    archivo=$1
    cantidad=$(wc -w < "$archivo")

    echo "La cantidad de palabras en $archivo es/son: $cantidad"
     
}

contar_palabras "$@"

