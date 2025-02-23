#!/bin/bash

# Haz un script en el que dos usuarios juegan a la ruleta rusa
# El orden de inicio se decide a cara o cruz
# cara: comienza el primer jugador y cruz: comienza el segundo jugador
# Debes crear un array booleano de 6 posiciones a false e insertar de forma
# aleatoria un true.
# los jugadores van disparando en orden hasta que alguno tiene suerte

linea() {
    echo "***********************************"
}

aleatorio() {

    MIN="$1"
    MAX="$2"
    echo $(( RANDOM % ( $MAX - $MIN + 1) + $MIN ))

}

crear_ruleta() {

    ruleta=(false false false false false false)
    posicionAleatoria=$(aleatorio 0 5)
    ruleta[posicionAleatoria]=true

    echo "${ruleta[@]}"

}

mensaje_bienvenida() {

    linea
    echo "Bienvenido a la ruleta rusa!"
    linea
    echo "Lanzamos la monera..." 

}

validar_jugador() {

    cara=0
    cruz=1
    monedaLanzada="$1"

    if [ "$monedaLanzada" = "$cara" ]; then
        echo "...ha salido cara!"
        echo "Comienza el JUGADOR 1."
        jugador="JUGADOR 1" 

    else 
        echo "...ha salido cruz!"
        echo "Comienza el JUGADOR 2."
        jugador="JUGADOR 2"
    fi

    echo $jugador
    linea

}

# --------------------------------- MAIN ---------------------------------

lanzarMoneda=$(aleatorio 0 1)
ruletaRusa=($(crear_ruleta))

mensaje_bienvenida
sleep 2

validar_jugador "$lanzarMoneda"

programa=true
posicion=0

while [ "$programa" = true ]; do

    echo "El $jugador aprieta el gatillo."

    if [ "${ruletaRusa[posicion]}" = false ]; then
        posicion=$((posicion + 1))
        echo "El $jugador sobrevive."
        linea
    else 
        echo "El $jugador ha muerto."
        programa=false
        linea
    fi

    if [ "$jugador" = "JUGADOR 1" ]; then
        jugador="JUGADOR 2"
    else
        jugador="JUGADOR 1"
    fi

done

echo "La recámara de la ruleta:"
echo "${ruletaRusa[@]}"
