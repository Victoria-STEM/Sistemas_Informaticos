#! /bin/bash

clear # limpiar pantalla.

reglas_juego() {
    echo "Hola."
    echo "1. Adivina un número entre 0 y 100; el programa te dirá si es mayor o menor."
    echo "2. Escribe "salir" para terminar el juego en cualquier momento."
    echo "3. El juego finaliza cuando aciertas el número o decides salir."
}

reglas_juego

numero="$((RANDOM % 101))"
juegoTerminado=false
contador=0

while [ "$juegoTerminado" = false ]; do

    read -p "Introduce un numero: " usuario

    if [ "$usuario" = "salir" ]; then
        echo "Juego terminado."
        juegoTerminado=true

    else

        if [ "$usuario" -ge 0 ] && [ "$usuario" -le 100 ]; then

            contador=$((contador + 1))

            if [ "$usuario" -lt "$numero" ]; then
                echo "El numero es mayor que $usuario."

            elif [ "$usuario" -gt "$numero" ]; then
                echo "El numero es menor que $usuario."

            else
                echo "Felicidades has acertado el $numero en $contador intentos."
                juegoTerminado=true

            fi

        else
            echo "Introduce un numero entre 1 y 100 correcto."
        fi

    fi 

done
