#!/bin/bash

# Enunciado: Script para sumar cartas de Blackjack
# 1 -> 11
# 2 -> 2
# 3 -> 3
# 4 -> 4
# 5 -> 5
# 6 -> 6
# 7 -> 7
# 8 -> 8
# 9 -> 9
# 10 -> 10
# 11 -> 10
# 12 -> 10
# 13 -> 10
# VALORES FUERA DE RANGO NO SE TIENEN EN CUENTA

# El objetivo es sumar el valor de las cartas sin pasarse de 21.
# Si el total es mayor que 21, el jugador pierde automáticamente.
# Las cartas son aleatorias y el jugador no introduce los valores.
tiradaJugador=Random
# El jugador puede seguir pidiendo cartas hasta alcanzar o superar 21 o decidir quedarse.

# Versión 1: Un solo jugador
# El jugador comienza con un total de 0.
# El jugador puede seguir pidiendo cartas hasta alcanzar o superar 21 o decidir quedarse.
# Si el total supera 21, el jugador pierde automáticamente.
# Si el jugador se queda, el total se muestra y se evalúa si ha ganado o perdido.

# Ejemplo de ejecución:
# $ ./blackjack.sh
# Introduce "seguir" para pedir otra carta o "quedarse" para finalizar el turno: seguir
# Carta aleatoria: 5
# Total: 5
# Introduce "seguir" para pedir otra carta o "quedarse" para finalizar el turno: seguir
# Carta aleatoria: 10
# Total: 15
# Introduce "seguir" para pedir otra carta o "quedarse" para finalizar el turno: quedarse
# Total final: 15
# ¡Felicidades! No te has pasado de 21.
