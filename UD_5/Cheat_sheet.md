## COMO GUARDAR EL RESULTADO DE UNA FUNCION

Siempre con echo "$variable" >> además, aunque sea echo no se imprime por pantalla.

```bash
resultadoJugador1=$(validar_argumentos "" "JUGADOR 1")
resultado=($(funcion_que_da_un_array))
```
Esta opcion guarda en una variable el resultado de una funcion a la que se le pasan los argumentos directamente. Lo que evita problemas.

## VALIDACIONES

Numero entero:
```bash
if [ ! "$argumento" =~ ^[0-9]+$ ]; then
    echo "Error. Se debe introducir un numero entero."
    return 1
fi
```

Que el argumento no esté vacio:
```bash
if [ -z "$archivo" ]; then
    echo "No se ha proporcionado un archivo valido."
    return 1
fi
```

Que el archivo exista:
```bash
if [ ! -e "$archivo" ]; then
    echo "El archivo no existe."
    return 1
fi
```

Que el archivo no esté vacio:
```bash
if [ ! -s "$archivo" ]; then
    echo "El archivo está vacio."
    return 1
fi
```

## ALEATORIO

Funcion con aleatorio:
```bash
lanzar_dado() {
    MIN=1
    MAX=6
    echo $(( RANDOM % ( $MAX - $MIN + 1) + $MIN ))
}
```

## ARRAYS

bonos=("0. 1GB: 5€;" "1. 5GB: 15€;" "2. 10GB: 25€;")

```bash
dir="/ruta/al/directorio"
if [ "$(basename "$dir" | cut -c1)" = "A" ]; then
    echo "La primera letra del directorio es A"
else
    echo "La primera letra del directorio NO es A"
fi
```

```bash

es_archivo_oculto() {
    for archivo in "$@"; do  # Itera sobre todos los parámetros
        if [[ -e "$archivo" && "$archivo" == .* ]]; then
            echo "$archivo es un archivo oculto."
        else
            echo "$archivo NO es un archivo oculto."
        fi
    done
}

es_directorio_oculto() {
  # Obtener el parámetro (nombre del directorio)
  dir="$1"
  
  # Comprobar si el primer carácter del nombre del directorio es "."
  if [[ ${dir:0:1} == "." ]]; then
    echo "El directorio '$dir' es oculto."
  else
    echo "El directorio '$dir' NO es oculto."
  fi
}



