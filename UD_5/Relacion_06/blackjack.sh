#!/bin/bash

# El objetivo es sumar el valor de las cartas sin pasarse de 21.
# Si el total es mayor que 21, el jugador pierde automáticamente.
# Las cartas son aleatorias y el jugador no introduce los valores.
# El jugador puede seguir pidiendo cartas hasta alcanzar o superar 21 o decidir quedarse.

sacar_carta() {
    MAX=13
    MIN=1
    cartaAleatoria=$(( RANDOM % ( $MAX - $MIN + 1 ) + $MIN ))
    puntuacion=$(($puntuacion + $cartaAleatoria))
    echo "Carta aleatoria: $cartaAleatoria"
    echo "Total: $puntuacion"
}

comprobar_resultado() {

    if [ "$puntuacion" -gt 21 ]; then 
        echo "Upsi dusi... Te has pasado y has perdido."
        juego=false
    elif [ "$puntuacion" -le 21 ]; then
        echo "¡Felicidades! No te has pasado de 21"
    else 
        echo "Vaya, te has pasado de 21. Has perdido."
    fi
}

# --------------------------------- MAIN ---------------------------------

puntuacion=0
juego=true

echo "Comienza el juego!"
echo "Tu puntuacion es: $puntuacion"

while [ $juego = true ]; do

    read -p "Introduce 'seguir' para pedir otra carta o 'quedarse' para finalizar el turno:" opcionJugador

    if [ "$opcionJugador" = "seguir" ]; then
        
        sacar_carta
        comprobar_resultado $puntuacion

    elif [ "$opcionJugador" = "quedarse" ]; then
        
        echo "Total final: $puntuacion"
        comprobar_resultado $puntuacion

        juego=false

    else 
        echo "Introduce una opcion valida: 'seguir' o 'quedarse'."
    fi

done
