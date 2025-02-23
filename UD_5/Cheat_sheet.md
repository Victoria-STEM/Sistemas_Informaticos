## COMO GUARDAR EL RESULTADO DE UNA FUNCION

Siempre con echo "$variable" >> además, aunque sea echo no se imprime por pantalla.

```bash
resultadoJugador1=$(validar_argumentos "" "JUGADOR 1")
```
Esta opcion guarda en una variable el resultado de una funcion a la que se le pasan los argumentos directamente. Lo que evita programas.

## VALIDACIONES

Numero entero:
```bash
if [[ ! "$argumento" =~ ^[0-9]+$ ]]; then
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