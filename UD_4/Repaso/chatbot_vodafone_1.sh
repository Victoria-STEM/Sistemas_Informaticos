#! /bin/bash

clear 

bienvenida () {
    echo "Bienvenida al Chatbot de Vodafone"
    read -p "Como te llamas? " nombreUsuario
    echo "Hola $nombreUsuario. En que puedo ayudarte hoy?"
}

menu () {
    echo "============================="
    echo "Menú Principal:"
    echo "1. Consultar saldo"
    echo "2. Activar un bono de datos"
    echo "3. Hablar con soporte técnico"
    echo "4. Salir"
    echo "============================="
}

imprimir_bonos() {
    for ((i=0; i<${#bonos[@]}; i++)); do
        indice=$(($i + 1))
        echo "$indice. ${bonos[$i]}"
    done
}

bienvenida

programa=true
bonos=("Bono 1GB: 5 euros" "Bono 5GB: 15 euros" "Bono 10GB: 25 euros")

while [ "$programa" = true ]; do

    menu
    read -p "Selecciona una opción (1-4): " opcion

    if [ "$opcion" -eq 1 ]; then
        echo "Tu saldo actual es: $((RANDOM % 50 + 0)) euros."

    elif [ "$opcion" -eq 2 ]; then
        imprimir_bonos
        opcionCorrecta=true
        
        while [ $opcionCorrecta = true ]; do
            read -p "Selecciona un bono (1-3):" opcionBono  

            if [ $opcionBono -eq 1 ] || [ $opcionBono -eq 2 ] || [ $opcionBono -eq 3 ]; then
                echo "Has activado el Bono ${bonos[opcionBono]}"
                opcionCorrecta=false
            
            else 
                echo "Opcion incorrecta."
            
            fi

        done

    elif [ "$opcion" -eq 3 ]; then
        read -p "Introduce tu problema: " problemaUsuario
        echo "Gracias por contarnos que: $problemaUsuario."
        echo "En breves un operador se pondrá en contacto contigo $nombreUsuario."

    elif [ "$opcion" -eq 4 ]; then       
        echo "Gracias por usar el Chatbot de Vodafone. ¡Hasta pronto, $nombreUsuario!"
        programa=false
    
    else 
        echo "Valor incorrecto. Introduce un valor entre 1 y 4."

    fi

done