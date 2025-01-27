#! /bin/bash

clear # limpiar pantalla.

ARCHIVO1="espada_de_verdad.txt"
ARCHIVO2="escudo_eterno.txt"
ARCHIVO3="amuleto_del_destino.txt"

creacion_archivos () {
    echo "Creando los artefactos sagrados del Mirror of Kalanda..."
    echo "Una hoja brillante hecha para cortar la oscuridad." > espada_de_verdad.txt
    echo "Un escudo que puede soportar cualquier ataque." > escudo_eterno.txt
    echo "Un amuleto que concede visiones del futuro." > amuleto_del_destino.txt

    echo "Artefactos creados:"
    ls -1 *.txt
}

menu () {
    echo "===== Mirror of Kalanda ====="
    echo "1. Leer las escrituras de los artefactos"
    echo "2. Destruir los artefactos y salir del mundo de Kalanda"
    echo "=============================="
}

mensaje_destruccion () {
    echo "Has elegido salir del mundo del Mirror of Kalanda."
    echo "Destruyendo los artefactos sagrados..."
    echo "Artefactos destruidos. Adiós al Mirror of Kalanda."
}

destruccion_archivos () {
    rm -f "$ARCHIVO3"
    rm -f "$ARCHIVO2"
    rm -f "$ARCHIVO1"
}

creacion_archivos

programa=true

    while [ "$programa" = true ]; do 

    	menu
        read -p "Elige una opción (1-2): " opcion

        if [ "$opcion" = 1 ]; then

            echo "=== Escrituras de los Artefactos ==="
            echo "Espada de Verdad:"
            cat "$ARCHIVO1"

            echo "Escudo Eterno:"
            cat "$ARCHIVO2"

            echo "Amuleto del Destino:"
            cat "$ARCHIVO3"

        elif [ "$opcion" = 2 ]; then
        
            mensaje_destruccion
            destruccion_archivos
            programa=false
        
        else 

            echo "Opcion invalida."

        fi

    done
