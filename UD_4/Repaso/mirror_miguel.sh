#!/bin/bash

# Archivos de los artefactos legendarios
ARCHIVO1="espada_de_verdad.txt"
ARCHIVO2="escudo_eterno.txt"
ARCHIVO3="amuleto_del_destino.txt"

# Crear los artefactos sagrados antes del bucle
echo "Creando los artefactos sagrados del Mirror of Kalanda..."
echo "Una hoja brillante hecha para cortar la oscuridad." > "$ARCHIVO1"
echo "Un escudo que puede soportar cualquier ataque." > "$ARCHIVO2"
echo "Un amuleto que concede visiones del futuro." > "$ARCHIVO3"
echo "Artefactos creados:"
ls -1 *.txt
echo

# Inicializar la variable de control del bucle
seguir=true

# Bucle del menú
while [ $seguir ]; do
    echo
    echo "===== Mirror of Kalanda ====="
    echo "1. Leer las escrituras de los artefactos"
    echo "2. Destruir los artefactos y salir del mundo de Kalanda"
    echo "=============================="
    read -p "Elige una opción (1-2): " opcion

    if [ "$opcion" -eq 1 ]; then
        echo "=== Escrituras de los Artefactos ==="
        echo "Espada de Verdad:"
        cat "$ARCHIVO1"
        echo
        echo "Escudo Eterno:"
        cat "$ARCHIVO2"
        echo
        echo "Amuleto del Destino:"
        cat "$ARCHIVO3"
        echo "===================================="

    elif [ "$opcion" -eq 2 ]; then
        echo "Has elegido salir del mundo del Mirror of Kalanda."
        seguir=false
    else
        echo "Opción no válida. Por favor, elige entre 1 y 2."
    fi
done

# Borrar los archivos después del bucle
echo "Destruyendo los artefactos sagrados..."
rm -f "$ARCHIVO1" "$ARCHIVO2" "$ARCHIVO3"
echo "Artefactos destruidos. Adiós al Mirror of Kalanda."./