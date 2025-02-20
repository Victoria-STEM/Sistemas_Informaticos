#!/bin/bash

# Crea un script en Bash que simule una carrera de caballos con tres participantes.
# La carrera se desarrolla por turnos, donde cada caballo avanza una distancia aleatoria 
# entre 1 y 5 metros por turno.
# La carrera finaliza cuando un caballo alcanza o supera los 20 metros.
# Se debe mostrar el progreso de la carrera en cada turno y anunciar al ganador al final.

numero_aleatorio() {
    MIN=1
    MAX=5
    echo $(( RANDOM % ( $MAX - $MIN + 1) + $MIN ))
}

avance() {
    resultadoCaballo1=$(numero_aleatorio)
    caballo1=$(($resultadoCaballo1 + $caballo1))
    echo "El caballo 1 avanza raudo: $caballo1 metros."

    resultadoCaballo2=$(numero_aleatorio)
    caballo2=$(($resultadoCaballo2 + $caballo2))
    echo "El caballo 2 avanza raudo: $caballo2 metros."

    resultadoCaballo3=$(numero_aleatorio)
    caballo3=$(($resultadoCaballo3 + $caballo3))
    echo "El caballo 3 avanza raudo: $caballo3 metros."
}

determinar_ganador() {
    if [ "$caballo1" -ge 20 ];then
        echo "Ha ganado el caballo 1!"
        programa=false
    elif [ "$caballo2" -ge 20 ];then
        echo "Ha ganado el caballo 2!"
        programa=false
    elif [ "$caballo3" -ge 20 ];then
        echo "Ha ganado el caballo 3!"
        programa=false
    fi
}

# -------------------------- MAIN -------------------------- #

caballo1=0
caballo2=0
caballo3=0
programa=true

echo "PUM! Comienza la carrera!"

while [ "$programa" = true ]; do
    
    avance $caballo1 $caballo2 $caballo3
    determinar_ganador $caballo1 $caballo2 $caballo3

done