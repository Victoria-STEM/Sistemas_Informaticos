#!/bin/bash

archivar_albumes() {

    artista=$1
    distino="discografica/archivados"
    shift

    if [ $# -eq 0 ]; then
        echo "Error: No se especificó artista ni albumes."
        return 1
    fi

    if [ $# -lt 2 ]; then
        echo "Error: Se necesita al menos 1 album."
        return 1
    fi
    
    if [ -z "$artista" ]; then
        echo "Error: No se especificó el nombre del artista."
        return 1
    fi

    if [ ! -d "$destino" ]; then
        mkdir -p "$destino"
    fi

    while [ $# -gt 0 ]; do
        album=$1
        mv "$album" "$destino/"
        echo "El album $album ha sido archivado."
        rm "$album"
        shift
    done
        
}

archivar_albumes "$@"
