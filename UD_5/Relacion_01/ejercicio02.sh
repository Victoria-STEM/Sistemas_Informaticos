#!/bin/bash

contar_archivos() {

    directorio=$1
    cantidad=$(find "$directorio" -type f | wc -l)

    echo "El directorio $directorio contiene $cantidad archivos."
}

contar_archivos "$1"