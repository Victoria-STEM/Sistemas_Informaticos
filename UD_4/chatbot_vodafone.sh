#! /bin/bas

nombre=$1
echo "Bienvenido al chatBot de Vodafone"
read -p "Como te llamas?" nombre

echo "Hola $nombre, En qué puedo ayudarte hoy?"
menu="a"

while [ "$menu" != "d" ]; do

    echo "Menu Principal:"
    echo "a. Consultar saldo."
    echo "b. Activar un bono de datos."
    echo "c. Hablar con soporte técnico."
    echo "d. Salir."
    read -p "Seleccione una opcion:" menu

    if [ "$menu" = "a" ]; then
        saldo=$((RANDOM % 50))
        echo "Saldo: $saldo €"

    elif [ "$menu" = "b" ]; then
        bonos=(" 1GB: 5€;" " 5GB: 15€;" " 10GB: 25€;")
        echo "${bonos[@]}"
        read -p "Introduce tu seleccion: " seleccion_usuario
        indice=$seleccion_usuario
        echo "Has saleccionado: ${bonos[$indice]}"

    elif [ "$menu" = "c" ]; then
        read -p "Introduce su problema" problema
        echo "Gracias por tu mensaje $nombre, un agente te contactará pronto."

    fi

    echo "Gracias por usar nuestro servicio. Hasta pronto. :)"

done