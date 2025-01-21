#! /bin/bash

# Ejercicio 01
if [ $1 -lt 18 ]; then
    echo "Eres menor de edad."
elif [ $1 -le 65 ]; then
    echo "Eres adulto."
else 
    echo "Eres mayor."
fi

# Ejercicio 02
numero=$1
for ((i=1; i<=numero; i++)); do 
    echo "El numero del argumento es: $1."
done

# Ejercicio 03
usuario=$1
contrasena=1234

while [ $usuario -ne $contrasena ]; do
    echo "Contrasena incorrecta."
    read -p "Vuelve a introducir la contraseña: " usuario
done
echo "Contraseña correcta."

# ARRAYS
# Ejercicios 01
peliculas=("Pelicula1" "Pelicula2" "Pelicula3" "Pelicula4" "Pelicula5")
echo "${peliculas[0]}" # primera posición.
echo "${peliculas[-1]}" # ultima posición.

# Ejercicio 02
frutas=("fresas" "mandarinas" "uvas" "platanos" "kiwis")
frutas[1]="naranjas"
"${frutas[@]}"

# Ejercicio 03
dias_semana=("lunes" "martes" "miercoles" "jueves" "viernes" "sabado" "domingo")
for dia in "${dias_semana[@]}"; do
    echo "$dia"
done

# Ejercicio 04
nombres=("Rosa" "Maria" "Luisa" "Fernanda")
apellidos=("Fernandez" "Sanchez" "Molina" "Moron")

nombres_apellidos=()

for ((i=0; i <${#nombre[-1]}; i++)); do
    nombres_apellidos[i]="${nombres[i]}" "${nombres[i]}"
done
echo "Nombres completos: ${nombre_apellidos[@]}"
