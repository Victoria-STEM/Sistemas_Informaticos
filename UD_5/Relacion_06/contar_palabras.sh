#!/bin/bash

# Crea un script en Bash que reciba un nombre de archivo como argumento y 
# cuente cuántas palabras tiene el archivo.

# Si el archivo no existe o no se proporciona un argumento válido, 
# el script debe mostrar un mensaje de error.

# Pista: el comando wc puede ayudarte a contar palabras en un archivo.

comprobar_archivo() {

    archivo="$@"

    if [ $# -lt 1 ]; then
        echo "No se ha proporcionado ningun archivo."
        return 1
    fi

    if [ -z "$archivo" ]; then
        echo "No se ha proporcionado un archivo valido."
        return 1
    fi

    if [ ! -e "$archivo" ]; then
        echo "El archivo no existe."
        return 1
    fi

    if [ ! -s "$archivo" ]; then
        echo "El archivo está vacio."
        return 1
    fi

    contar_palabras "$@"
}

contar_palabras() {

    archivo="$@"
    palabras=$(wc -w < "$archivo")
    echo "El archivo tiene $palabras palabras."

}

# ------------------------- MAIN -------------------------

comprobar_archivo "$@"