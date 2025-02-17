#!/bin/bash

mostrar_menu() {

    echo "IKEA - Sistema de Gestión de Inventario"
    echo "1. Agregar producto al inventario"
    echo "2. Mostrar productos en inventario"
    echo "3. Realizar un pedido"
    echo "4. Listar pedidos realizados"
    echo "5. Salir"

}

agregar_producto() {

    inventario="inventario.txt"

    if [ ! -f "$inventario" ]; then
        touch "$inventario"
    fi

    echo "$1 $2" >> "$inventario"
    shift 2

}

mostrar_inventario() {

    inventario="inventario.txt"

    if [ ! -s "$inventario" ]; then
        echo "No hay productos en el inventario."
    else 
        echo "Productos en Inventario:"
        cat "$inventario"
    fi

}

realizar_pedido() {

    pedido="pedidos.txt"

    if [ ! -f "$pedido" ]; then
        touch "$pedido"
    fi

    echo "$1 ($2 unidades)" >> "$pedido"
    echo "Pedido realizado: $2 unidad/es de $1"
    shift 2

}

listar_pedidos() {

    pedido="pedidos.txt"

    if [ ! -s "$pedido" ]; then
        echo "No hay pedidos registrados."
    else 
        echo "Pedidos Realizados:"
        cat "$pedido"
    fi

}

procesar_pedido() {

    programa=true

    while [ "$programa" = true ]; do

        mostrar_menu
        read -p "" opcion

        if [ "$opcion" -eq 1 ]; then

            echo "Escribe el producto:"
            read -p "" producto
            echo "Escribe la cantidad:"
            read -p "" cantidad

            agregar_producto "$producto" "$cantidad"
            shift 2

        elif [ "$opcion" -eq 2 ]; then

            mostrar_inventario

        elif [ "$opcion" -eq 3 ]; then

            echo "Escribe el producto:"
            read -p "" pedido 
            echo "Escribe la cantidad:"
            read -p "" cantidad

            realizar_pedido "$pedido" "$cantidad"
            shift 2

        elif [ "$opcion" -eq 4 ]; then

            listar_pedidos

        elif [ "$opcion" -eq 5 ]; then

            programa=false

        else 

            echo "Opcion incorrecta."

        fi

    done

}

# ---------------------------------------- MAIN ----------------------------------------

procesar_pedido