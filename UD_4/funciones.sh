#!/bin/bash

# Funcion de sumar:
sumar() {
  echo "resultado=$(( $1 + $2 ))"  # Sumar los valores de $1 y $2.
}

suma=$(sumar 5 3)
echo "La suma es: $suma"

# Incluir siempre el uso obligatorio de los argumentos:
if [ $# -ne 2 ]; then
  
  echo "Uso: <elemento1> < elemento2>"
  return 1 # O exit 1.

fi

