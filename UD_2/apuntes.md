
## Gestion de cuentas y contraseñas

Para bloquear la cuenta de un usuario:
```bash 
passwd -l nombre_usuario
```

Para cambiar las especificaciones de una contraseña:
```bash
(sudo) nano /etc/pam.d/common-password # para acceder al archivo de la contraseñas
password requisite pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 # para ajustar la contraseña a las espedicifaciones. 
```

Esto exige que las contraseñas tengan al menos:
- 10 caracteres
- 1 letra mayúscula
- 1 letra minúscula
- 1 número
- 1 carácter especial

Para inhabilitar una cuenta de un usuario:
```bash
(sudo) chage -E XXXX-XX-XX nombre_usuario
```


## Procesos

Para identificar los procesos abiertos: 
```bash
ps aux # muestra todos los procesos del sistema junto con detalles de su uso de CPU y memoria.
ps -e # muestra todos los procesos en el sistema.
ps -u nombre_usuario # muestra los procesos de un usuario específico.
ps -C nombre_proceso # muestra solo los procesos que hayamos nombrado.
ps -ejH # muestra la jearquía de procesos en forma de arbol con sus relaciones.
ps -ef | grep nombre_comando
ps -o pid,state,cmd | grep nomber_comando # para observar
```

Para detener un proceso o cancelarlo:
```bash
ctrl + z # para detenerlo
ctrl + c # para cancelarlo
```

Para mostrar la lista de los trabajos actuales en la sesión de terminal, indicando si están en primer plano, en segundo plano o detenidos:
```bash
jobs    # lista todos los trabajos actuales.
jobs -l # muestra una lista con el PID de cada trabajo.
jobs -p # muestra una lista de solo el PID de los trabajos en segundo plano.
```

Para reanudar un trabajo detenido y ejecutarlo en segundo plano:
```bash
bg numero_trabajo # si se omite el numero, la terminal reanuda el ultimo trabajo detenido.
bg %2 # reanuda el trabajo numero 2, % se usa para hacer referencia a un trabajo.
```

Para traer un trabajo de segundo plano o detenido a primer plano:
```bash
fg job_ID # si se omite el job_ID se trae el ultimo trabajo
fg %1 # trae el trabajo 1 a primer plano.
```

```bash
```

```bash
```