#! /bin/bash

echo "Este script permite monitorear el estado del sistema."
monitorear=true

mkdir carpeta1
mkdir carpeta2

    while [ "$monitorear" = true ]; do

        echo "a. Ver uso de CPU."
        echo "b. Ver uso de memoria RAM."
        echo "c. Ver espacio en disco."
        echo "d. Ver procesos activos."
        echo "e. Ver usuarios conectados."
        echo "f. Salir del script."
        read -p "Introduce una opcion: " opcion

        if [ "$opcion" = "a" ]; then
            top -bn1 | grep "%Cpu(s)" | awk '{print "Uso actual: " $2 "%"}'

        elif [ "$opcion" = "b" ]; then
            free -h | awk '/Mem:/ {print "Total: "$2 " Usada: "$3 " Disponible: "$4}'

        elif [ "$opcion" = "c" ]; then
            df -h | grep -v tmpfs

        elif [ "$opcion" = "d" ]; then
            ps aux --sort=-%cpu | head -n 6

        elif [ "$opcion" = "e" ]; then
            who

        elif [ "$opcion" = "f" ]; then
            monitorear=false

        else 
            echo "Opcion invalida."

        fi

    done

echo "Gracias por usar el monitor de recursos. ¡Hasta pronto!"