#! /bin/bash

clear # limpiar pantalla.

reglas_juego() {
    echo "Hola."
    echo "1. Adivina un número entre 0 y 100; el programa te dirá si es mayor o menor."
    echo "2. Escribe "salir" para terminar el juego en cualquier momento."
    echo "3. El juego finaliza cuando aciertas el número o decides salir."
}

volver_jugar() {

    read -p "Volver a jugar? (1) Si, (2) No." usuario

    if  [ "$usuario" -eq 2 ]; then
        juegoTerminado=true

    elif [ "$usuario" -eq 1 ]; then 
        jugar_adivinanza

    else
        echo "Introduce un valor correcto."
    fi

}

jugar_adivinanza() {

    numero="$((RANDOM % 101))"
    juegoTerminado=false
    contador=0
    volverJugar=0

    while [ "$juegoTerminado" = false ]; do
    
        read -p "Introduce un numero: " usuario
    
        if [ "$usuario" = "salir" ]; then
            volver_jugar
    
        else
    
            if [ "$usuario" -ge 0 ] && [ "$usuario" -le 100 ]; then
    
                contador=$((contador + 1))
    
                if [ "$usuario" -lt "$numero" ]; then
                    echo "El numero es mayor que $usuario."
    
                elif [ "$usuario" -gt "$numero" ]; then
                    echo "El numero es menor que $usuario."
    
                else
                    echo "Felicidades has acertado el $numero en $contador intentos."
                    volver_jugar
                fi
    
            else
                echo "Introduce un numero entre 1 y 100 correcto."
            fi
    
        fi 
    
    done

}

reglas_juego
jugar_adivinanza