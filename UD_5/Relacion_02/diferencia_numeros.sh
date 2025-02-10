#!/bin/bash

calcular_diferencia() {
    numeroInicial=$1
    resta=0
    shift
    while [ $# -gt 0 ]; do
        resta=$(( numeroInicial - $1))
        echo "Diferencia con $1: $resta"
        shift
    done
}

calcular_diferencia $@