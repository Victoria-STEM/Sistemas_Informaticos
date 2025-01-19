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
echo "El numero del argumento es: $1."

# Ejercicio 03
contrasena=1234
while [ $1 -eq contrasena ]; do
    echo "Contrasena correcta."
done

# Arrays
# Ejercicios 01
peliculas=("Pelicula1" "Pelicula2" "Pelicula3" "Pelicula4" "Pelicula5")
echo "${peliculas[0]}"
echo "${peliculas[4]}"

# Ejercicio 02
frutas=("fresas" "mandarinas" "uvas" "platanos" "kiwis")
frutas[1]="naranjas"

# Ejercicio 03
dias_semana=("lunes" "martes" "miercoles" "jueves" "viernes" "sabado" "domingo")
for dia in "${dias_semana[@]}"; do
    echo "§dia"
done

# Ejercicio 04
nombres=("Rosa" "Maria" "Luisa" "Fernanda")
apellidos=("Fernandez" "Sanchez" "Molina" "Moron")

nombres_apellidos=()

for i in "${!nombres[@]}"; do
    nombres_apellidos+=("${nombres[i]}")
    nombres_apellidos+=("${apellidos[i]}")
done
