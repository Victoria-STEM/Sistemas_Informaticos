#!/bin/bash

# Crea un script en Bash que permita a dos jugadores jugar a piedra, papel o tijeras.
# Cada jugador ingresará su elección por argumento (piedra, papel o tijeras).
# El script determinará quién gana según las reglas del juego o si hay un empate.
# Si los argumentos no son válidos, se debe mostrar un mensaje de error.

validar_argumentos() {

    jugador="$1"
    nombreJugador="$2"

    while [ "$jugador" != "piedra" ] && [ "$jugador" != "papel" ] && [ "$jugador" != "tijera" ]; do
        read -p "$nombreJugador - Introduce una opcion valida (piedra, papel o tijera): " jugador
    done

    echo "$jugador"

}

comparar_resultados() {

    opcionJugador1="$1"
    opcionJugador2="$2"

    if [ "$opcionJugador1" = "piedra" ] && [ "$opcionJugador2" = "tijera" ] || [ "$opcionJugador1" = "papel" ] && [ "$opcionJugador2" = "piedra" ] || [ "$opcionJugador1" = "tijera" ] && [ "$opcionJugador2" = "papel" ]; then
        echo "Jugador 1 gana."
    elif [ "$opcionJugador1" = "$opcionJugador2" ]; then
        echo "Empate."
    else 
        echo "Jugador 2 gana."
    fi

}

# ------------------------------- MAIN -------------------------------

echo "Bienvenida al juego de piedra, papel y tijera"

resultadoJugador1=$(validar_argumentos "" "JUGADOR 1")
resultadoJugador2=$(validar_argumentos "" "JUGADOR 2")

comparar_resultados "$resultadoJugador1" "$resultadoJugador2"




