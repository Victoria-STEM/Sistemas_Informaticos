#!/bin/bash

INVENTARIO="inventario.txt"
PEDIDOS="pedidos.txt"

linea() {
    echo "******************************************"
}

menu() {
    linea
    echo "IKEA - Sistema de Gestión de Inventario"
    echo "1. Agregar producto al inventario"
    echo "2. Mostrar productos en inventario"
    echo "3. Realizar un pedido"
    echo "4. Listar pedidos realizados"
    echo "5. Salir"
    linea
}

agregar_producto() {
    if [ $# -ne 2 ]; then
        echo "Error: argumentos insificientes."
    else 
        producto="$1"
        cantidad="$2"
        echo "Producto agregado: $cantidad unidad/es de $producto."
        echo "$producto $cantidad" >> inventario.txt
    fi
    linea
}

mostrar_inventario() {
    if [ ! -s $INVENTARIO ]; then
        echo "No hay productos en el inventario."
    else 
        echo "Productos en Inventario:"
        cat $INVENTARIO
    fi
}

realizar_pedido() {
    producto="$1"
    cantidad="$2"
    echo "Pedido realizado: $cantdiad unidad/es de $producto."
    echo "$producto $cantidad" >> pedidos.txt
}

listar_pedidos() {
    if [ ! -s $PEDIDOS ]; then
        echo "No hay pedidos realizados."
    else 
        cat $PEDIDOS
    fi
}

# -------------------------- MAIN -------------------------- 

programa=true

while [ $programa = true ]; do

    menu
    read -p "Escribe la opcion: " opcion

    if [ "$opcion" = "1" ]; then
        read -p "Introduce el nombre producto: " producto
        read -p "Introduce la cantidad de productos: " cantidad
        agregar_producto "$producto" "$cantidad"
    
    elif [ "$opcion" = "2" ]; then
        mostrar_inventario
    
    elif [ "$opcion" = "3" ]; then
        read -p "Introduce el nombre producto: " producto
        read -p "Introduce la cantidad de productos: " cantidad
        realizar_pedido "$producto" "$cantidad"

    elif [ "$opcion" = "4" ]; then
        listar_pedidos

    elif [ "$opcion" = "5" ]; then
        programa=false
        
    fi

    sleep 1

done


