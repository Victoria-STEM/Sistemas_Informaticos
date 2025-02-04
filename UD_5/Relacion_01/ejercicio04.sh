#!/bin/bash

validar_contraseña() {

    if [ $# -eq 0 ]; then
        echo "Error: No se han pasado argumentos."
        return 1
    fi

    contrasena=$1

    if [ "${#contrasena}" -lt 8 ] || ! [[ "$contrasena" =~ [A-Z] ]] || ! [[ "$contrasena" =~ [0-9] ]]; then
        
        mensaje="Contrasena invalida."

        if [ "${#contrasena}" -lt 8 ]; then
            mensaje+=" Debe tener al menos 8 caracteres."
        fi

        if ! [[ "$contrasena" =~ [[:upper:]] ]]; then
           mensaje+=" Debe tener al menos una mayuscula."
        fi

        if ! [[ "$contrasena" =~ [0-9] ]]; then
            mensaje+=" Debe tener al menos un numero."
        fi

    else 
       mensaje="Contrasena valida."
    fi

    echo $mensaje

}

validar_contraseña "$@"