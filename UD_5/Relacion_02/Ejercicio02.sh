#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: No se han pasado argumentos."
    exit 1
fi

verificar_contraseña_fuerte() {

    contrasena="$1"

    if [ "${#contrasena}" -lt 10 ] || 
        ! [[ "$contrasena" =~ [A-Z] ]] || 
        ! [[ "$contrasena" =~ [0-9] ]] || 
        ! [[ "$contrasena" =~ [!@#$%^&\*] ]]; then
        
        mensaje="Contrasena invalida."

        if [ "${#contrasena}" -lt 10 ]; then
            mensaje+=" Debe tener al menos 8 caracteres."
        fi

        if ! [[ "$contrasena" =~ [A-Z] ]]; then
           mensaje+=" Debe tener al menos una mayuscula."
        fi

        if ! [[ "$contrasena" =~ [0-9] ]]; then
            mensaje+=" Debe tener al menos un numero."
        fi

        if ! [[ "$contrasena" =~ [!@#$%^&\*] ]]; then
            mensaje+=" Debe tener al menos un caracter especial."
        fi

    else 
        mensaje="Contrasena fuerte."

    fi

    echo "$mensaje"

}

verificar_contraseña_fuerte "$@"