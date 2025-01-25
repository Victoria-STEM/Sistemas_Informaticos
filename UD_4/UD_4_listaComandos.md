# UD4. Creacion de Scripts

Encabezado `#!/bin/bash` para la creacion de scripts en bash.
`echo` imprime un mensaje.
`#` crea comentarios.

```bash
#!/bin/bash
nombre="Carlos"
echo "¡Hola, $nombre! Bienvenido al sistema."
``` 

## Variables globales:
Son variables definidas por el sistema operativo y están disponibles para todos los scripts y procesos. Se pueden usar en cualquier parte del sistema.
`$HOME` – Ruta del directorio personal del usuario.
`$PATH` – Lista de directorios donde Bash busca comandos ejecutables.
`$USER` – Nombre del usuario actual.

```bash
echo "Tu directorio personal es: $HOME"
```

## Variables especiales de bash:
`$0` – Nombre del script.
`$1, $2, $3...` – Argumentos pasados al script.
`$#` – Número de argumentos pasados al script.
`$?` – Estado de salida del último comando (0 si fue exitoso, diferente de 0 si hubo un error).

Operaciones con Variables
`+`  Suma.
`-` Resta.
`*` Multiplicación.
`/` División.
`%` Módulo (resto de la división).
`**` Exponenciación (potencia).

```bash
x=15
y=4

echo "Suma: $((x + y))"
echo "Resta: $((x - y))"
echo "Multiplicación: $((x * y))"
echo "División: $((x / y))"
echo "Módulo: $((x % y))"
echo "Potencia: $((x ** y))"
```

## Operadores de Comparación en Bash
Los operadores de comparación permiten evaluar condiciones numéricas en Bash. A continuación, se muestra una lista de los operadores más comunes:

- eq – Igual a (a -eq b es cierto si a es igual a b).
- ne – No es igual a (a -ne b es cierto si a no es igual a b).
- lt – Menor que (a -lt b es cierto si a es menor que b).
- le – Menor o igual que (a -le b es cierto si a es menor o igual a b).
- gt – Mayor que (a -gt b es cierto si a es mayor que b).
- ge – Mayor o igual que (a -ge b es cierto si a es mayor o igual a b).

```bash
#!/bin/bash
num=15
if [ $num -lt 10 ]; then
  echo "$num es menor que 10"
elif [ $num -eq 10 ]; then
  echo "$num es igual a 10"
else
  echo "$num es mayor que 10"
fi
```

## Buble For
El bucle **for** itera sobre una lista de elementos o un rango de números y ejecuta un conjunto de comandos para cada elemento.
```bash
numero=$1
for ((i=1; i<=numero; i++)); do
    echo $i
done
```

## Buble While
El bucle **while** ejecuta repetidamente un bloque de código mientras una condición sea verdadera.
```bash
# OPCION 1:
contador=1
while [ $contador -le 5 ]; do
  echo "Iteración $contador"
  ((contador++))
done

# OPCION 2:
password=$1
contrasenia=1234
while [ $password -ne $contrasenia ]; do
    echo "Contraseña incorrecta"
    read -p "Intenta de nuevo: " password
done
echo "Contraseña correcta"
```

## Arrays
Declaración de un array vacío:
```bash
mi_array=()
```
Array relleno:
```bash
mi_array=("Juan" "María" "Luis" "Ana")

echo ${mi_array[0]}  # Imprime "Juan"
echo ${mi_array[2]}  # Imprime "Luis"
echo ${mi_array[@]}  # Imprime "Juan María Luis Ana"
```
Diferencias entre @ y *:
```bash
${mi_array[@]} – Mantiene los elementos como unidades individuales.
${mi_array[*]} – Los elementos se tratan como una cadena de texto.
```
Modificar un array:
```bash
mi_array+=("Carlos") # Anade "Carlos"
mi_array[1]="Marta"  # Cambia "María" por "Marta"
unset mi_array[2]  # Elimina "Luis"
```
Longitud de un array:
```bash
echo "Número de elementos: ${#mi_array[@]}"
echo "Última película: ${peliculas[-1]}" # Ultima posicion en un array
```
Iterar sobre un Array:
```bash
for nombre in "${mi_array[@]}"; do
  echo "Hola, $nombre"
done

Resultado:
Hola, Juan
Hola, Marta
Hola, Luis
Hola, Ana
Hola, Carlos
```
Combinacion de array:
```bash
#!/bin/bash
nombres=("Juan" "María" "Pedro")
apellidos=("Pérez" "López" "García")

for ((i=0; i<${#nombres[@]}; i++)); do
    completo[i]="${nombres[i]} ${apellidos[i]}"
done
echo "Nombres completos: ${completo[@]}"
```

## Aplicaciones Comunes de Arrays
Listas de archivos:
```bash
archivos=(*.txt)
echo "Archivos de texto: ${archivos[@]}"
```
Resultados de comandos:
```bash
procesos=($(ps aux | awk '{print $1}'))
echo "Usuarios con procesos activos: ${procesos[@]}"
```
Gestión de parámetros múltiples:
```bash
argumentos=("$@")
echo "Se pasaron los siguientes argumentos: ${argumentos[@]}"
```

Crear **random**:
Número aleatorio en un rango específico: Si necesitas un número en un rango, usa el operador módulo (%) para limitar el valor y suma para ajustar el inicio del rango.

Ejemplo: Generar un número entre 1 y 100:
```bash
echo $((RANDOM % 100 + 1))
random_index=$((RANDOM % ${#items[@]})) # Generar índice aleatorio entre 0 y la longitud de la lista - 1
```

### Recuerda!
Dale al script los permisos de ejecucion:
```bash
chmod +x indice_random.sh
```