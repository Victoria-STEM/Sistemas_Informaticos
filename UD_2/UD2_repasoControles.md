# REPASO UD-2 // SISTEMAS INFORMATICOS

## Permisos y propietarios

Para **verificar los permisos** de archivos:
```bash
ls -l archivo.txt 
# -l indica los permisos del archivo, con ls solo muestra el archivo.
```

Para **cambiar permisos** de un archivo:
```bash
chmod XXX archivo.txt
```
- 0 = none
- 1 = execute
- 2 = write
- 3 = write + execute
- 4 = read
- 5 = read + execute
- 6 = read + write
- 7 = read + write + execute

Para **cambiar el propietario** de un archivo:
```bash
(sudo) chown nuevo_propietario archivo.txt
(sudo) chown nuevo_propietario:nuevo_grupo archivo.txt # para cambiar A LA VEZ usuario y grupo.
```

Para **cambiar el grupo** de un archivo:
```bash
(sudo) chgrp nuevo_grupo archivo.txt
```

## Ver, crear, modificar y eliminar usuarios y grupos

Para verificar un usuario:
```bash
id nombre_usuario # mostrando el UID (User ID), GID (Group ID) y todos los grupos del usuario.
whoami # muestra el usuario de la terminal
grep nombre_usuario /etc/passwd # verifica la creacion de un usuario con una shell predeterminada.
cat /etc/passwd # para listar TODOS LOS USUARIOS del sistema.
ls /home/nombre_usuario # para verificar un usuario creado en home.
```

Para crear un usuario:
```bash
(sudo) adduser nombre_usuario
(sudo) adduser --home /ruta/ruta/nombre_usuario nombre_usuario # para personalizar el directorio del usuario.
(sudo) adduser --home /opt/usuarios/pedro pedro # ejemplo!
(sudo) adduser --shell /bin/zsh nombre_usuario # para crear una shell del nuevo usuario en /bin/zsh.
(sudo) adduser --ingroup nombre_grupo # asigna un usuario a un grupo diferente al que se le asignaria por defecto.
```

Para eliminar un usuario:
```bash
(sudo) deluser nombre_usuario
(sudo) deluser --remove-home nombre_usuario # elimina el usuario y su directorio de inicio.
(sudo) deluser --backup nombre_usuario # crea un archivo comprimido del usuario antes de eliminar el backup.
(sudo) deluser --remove-all-files nombre_usuario # elimina todos los archivos del usuario del sistema.
```

Para verificar que se ha eliminado un usuario:
```bash
ls /home/nombre_usuario
id nombre_usuario
grep nombre_usuario /etc/passwd
```

Para realizar cambios en un usuario:
```bash
(sudo) usermod -l nombre_nuevo nombre_antiguo # cambiar NOMBRE
(sudo) usermod -d nueva_ruta nombre_usuario # cambia el DIRECTORIO de inicio.
(sudo) usermod -s nueva_shell nombre_usuario # cambia la SHELL.
(sudo) usermod -L nombre_usuario # para BLOQUEAR la cuenta de un usuario.
(sudo) usermod -U nombre_usuario # para DESBLOQUEAR la cuenta de un usuario.
```

Para anadir un usuario a un grupo:
```bash
(sudo) usermod -aG nombre_grupo nombre_usuario # grupo SECUNDARIO
(sudo) usermod -g nombre_grupo nombre_usuario # grupo PRINCIPAL
```

Para crear un grupo:
```bash
(sudo) groupadd nombre_grupo
(sudo) groupadd -g XXXX nombre_grupo # para crear un grupo con un GID determinado
(sudo) groupadd -r # Crea un grupo de sistema con un GID menor a 1000. Los grupos de sistema se utilizan para servicios y aplicaciones.
```

Para eliminar un grupo:
```bash
(sudo) groupdel nombre_grupo
```

Para cambiar el nombre, GID o usuarios de un grupo:
```bash
(sudo) groupmod -n nuevo_nombre antiguo_nombre # Cambia el nombre del grupo.
(sudo) groupmod -g nuevo_GID nombre_grupo # Modifica el GID del grupo.
(sudo) groupmod -R nombre_usuario nombre_grupo # Elimina uno o más usuarios del grupo.
```

Para listar los grupo secundarios a los que pertenece un usuario:
```bash
groups nombre_usuario
```

Para verificar la creacion de un grupo y **los usuarios que pertenecen a un grupo**:
```bash
getent group nombre_grupo
nano /etc/group # muestra todos los grupos de los usuarios.
```


## Sudo

Para actualizar la lista de paquetes de un sistema:
```bash
sudo apt update
```

Para abrir la terminal como sudo:
```bash
sudo -s
```

Para ejecutar un comando en nombre de un usuario:
```bash
sudo -u nombre_usuario nombre_comando
Ej: sudo -u syslog ls /var/log # ejecuta ls en nombre del usuario syslog en /var/log.
su - nombre_usuario # cambia al usuario especificado, accediendo a su entorno y permisos. Requiere la contraseña del usuario al que se desea cambiar.
```

Para que los usuarios puedan usar un alias:
```bash
sudo nano /etc/sudoers # para entrar en el archivo con los permisos
sudo visudo

# dentro del archivo sudoers, la estructura es:
# usuario HOST=(USUARIO_CUENTA) COMANDO

Ej! maria ALL=(ALL) NOPASSWD: /usr/sbin/systemctl restart nginx # para permitir a maria reiniciar el servicio nginx sin que se le solicite la contrasena.
# User ALias
User_Alias ADMINS = juan, carlos, maria # para indicar qué usuarios tienen qué alias. En este caso el alias es ADMINS y contiene a los usuarios juan, carlos y maria.
# Cmnd Alias
Cmnd_Alias SHUTDOWN_CMDS = /sbin/shutdown, /sbin/reboot # para indicar un alias para una serie de comandos. En este caso es para ejecutar los comandos shutdown y reboot
# User + Comns Alias
ADMINS ALL=(ALL) SHUTDOWN_CMDS # aquí se indica qué alias de usuarios disponen de qué alias de comandos. ADMINS pueden ejecutar SHUTDOWN_CMDS.
# Otros ejemplos:
%nombre_grupo ALL=(ALL) ALL # permite que los usuarios del nombre_grupo puedan usar sudo.
nombre_usuario ALL=(ALL) ALL # permita al usuario usar sudo, como si fuese root.
```
EL simbolo % hace referencia a un grupo. 



## Administracion de cuentas y contrasenas

Para configurar contrasena y sus especificaciones:
```bash
(sudo) nano /etc/pam.d/common-password # para entrar en el archivo de las contrasenas.

# Dentro del archivo passwd:
PASS_MAX_DAYS 60 # Las contraseñas deben cambiarse cada 60 días
PASS_MIN_DAYS 1 # Número mínimo de días que deben transcurrir antes de cambiar su contraseña nuevamente.
PASS_WARN_AGE 5 # Los usuarios recibirán una advertencia 5 días antes de que sus contraseñas caduquen.
password requisite pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 # para ajustar la contraseña a las espedicifaciones. 
```
Esto exige que las contraseñas tengan al menos:
- 10 caracteres
- 1 letra mayúscula
- 1 letra minúscula
- 1 número
- 1 carácter especial


Para bloquear o desbloquear la cuenta de un usuario:
```bash
(sudo) passwd nombre_usuario # cambia la contrasena del usuario.
(sudo) passwd -l nombre_usuario # en el archivo /etc/shadow el sistema agregará un signo ! al inicio del hash de la contraseña, lo que impide que el usuario pueda autenticarse. 
(sudo) passwd -u nombre_usuario # desbloquea la cuenta del usuario.
(sudo) passwd -d nombre_usuario # para eliminar la contrasena de un usuario.
(sudo) passwd -e nombre_usuario # la contrasena expira inmediatamente.
(sudo) chage -l nombre_usuario # muestra la informacion de caducidad de una cuenta.
(sudo) chage -E XXXX-XX-XX nombre_usuario # para inhabilitar una cuenta de un usuario en un momento concreto
(sudo) chage -M numero # para cambiar la contrasena cada numero de dias.
(sudo) chage -m numero # para indicar el numero de caracteres de la contrasena.
```


## Gestión y monitoreo de Procesos

Para identificar los procesos abiertos: 
```bash
ps aux # muestra todos los procesos del sistema junto con detalles de su uso de CPU y memoria.
ps -e # muestra todos los procesos en el sistema.
ps -u nombre_usuario # muestra los procesos de un usuario específico.
ps -C nombre_proceso # muestra solo los procesos que hayamos nombrado.
ps -ejH # muestra la jearquía de procesos en forma de arbol con sus relaciones.
ps -f # muestra una salida detallada (formato extendido)
ps -ef | grep nombre_comando # muestra todo los procesos del sistema de forma detallada que contengan el nombre del comando solicitado
ps -o pid,state,cmd | grep nomber_comando # para observar un comando en concreto
ps -o pid,nice,cmd | grep nomber_comando # para observar el nice de un comando en concreto.
ps -u root | wc -l # sirve para listar los procesos de un usuario concreto, restando una línea por el encabezado.
```

Tipos de procesos: 

1. **Running (R)**: se encuentra actualmente en ejecución o está listo para ejecutarse. 

2. **Sleeping (S)**: se encuentra inactivo, esperando un evento o recurso.
Se divide en dos subtipos:
- Uninterruptible Sleep (D): El proceso no puede ser interrumpido por señales. 
- Interruptible Sleep (S): El proceso puede ser despertado por una señal.
Indicación en ps: Se muestra como S (Interruptible Sleep) o D (Uninterruptible Sleep).

3. **Stopped (T)**: el proceso ha sido detenido por una señal, generalmente por intervención del usuario (Ctrl + Z) o por el comando kill -STOP [PID]. Un proceso detenido no consume recursos del sistema, pero sigue existiendo en la tabla de procesos.

4. **Zombie (Z)**: ha terminado su ejecución, pero su descriptor aún está en la tabla de procesos porque su proceso padre no ha leído su estado de salida (esto ocurre cuando el proceso padre no ha ejecutado la llamada wait()). Los procesos zombie no consumen recursos, pero ocupan un lugar en la tabla de procesos, lo que puede indicar un problema de diseño del proceso padre.
Ejemplo: Un proceso hijo que finaliza y su proceso padre no captura su estado de salida.


Para detener un proceso o cancelarlo:
```bash
ctrl + z # para detenerlo
ctrl + c # para cancelarlo
```

Para mostrar la lista de los trabajos **que se estan ejecutando** en la sesión de terminal, indicando si están en primer plano, en segundo plano o detenidos:
```bash
jobs    # lista todos los trabajos actuales.
jobs -l # muestra una lista con el PID de cada trabajo.
jobs -p # muestra una lista de solo el PID de los trabajos en segundo plano.
```

Para reanudar un trabajo detenido y ejecutarlo en segundo plano:
```bash
bg %numero_trabajo # si se omite el numero, la terminal reanuda el ultimo trabajo detenido.
bg %2 # reanuda el trabajo numero 2, % se usa para hacer referencia a un trabajo.
```

Para traer un trabajo de segundo plano o detenido a primer plano:
```bash
fg job_ID # si se omite el job_ID se trae el ultimo trabajo
fg %1 # trae el trabajo 1 a primer plano.
```

Para matar un proceso:
```bash
kill -15 PID # acaba con un proceso de forma educada y controlada. Si el proceso no debe acabar entonces no lo hará.
kill -9 PID  # cierra un proceso sí o sí, sin poder controlar la senal lo que puede ser peligroso... Solo es conveniente usarlo si -15 no funciona y es fundamental que el proceso acabe.
kill -1 PID  # Indica que el proceso debe recargar su configuración. Se utiliza comúnmente para reiniciar servicios sin detenerlos.
kill -STOP PID # detiene el proceso sin terminarlo.
kill -CONT PID # reanuda el proceso detenido.
------
pkill -f palabra # termina todos los procesos que contenga la palabra senalada.
killall nombre_proceso # termina todos los procesos nombrados.
```

**Proceso Huérfano** es un proceso cuyo padre ha finalizado o ha sido eliminado, dejando al proceso hijo sin un controlador directo. Cuando un proceso se queda huérfano, el sistema lo reasigna al proceso init (PID 1), que se convierte en su nuevo padre.
Ejemplo: Si un proceso de usuario lanza un script y el usuario cierra la sesión, el script se convierte en un proceso huérfano.

**Los daemons** son procesos de sistema que se ejecutan en segundo plano y realizan tareas de soporte, como gestionar conexiones de red, administrar bases de datos o monitorear el sistema. Los daemons generalmente se inician durante el arranque del sistema y no tienen interacción directa con el usuario. A diferencia de un proceso huérfano, un daemon no es creado debido a la terminación de su padre, sino que se ejecuta intencionalmente de forma independiente.
Ejemplo: sshd (demonio del servicio SSH) o httpd (demonio del servidor web Apache).

Para mostrar información en tiempo real de los procesos:
```bash
top
top -u nomre_usuario # para mostrar los procesos de un usuario. Tambien funciona con htop.
top -d 5 # cambia el intervalo de actualizacion a 5 segundos (por defecto son 3 segundos).
htop # version una interfaz un poco más elaborada.
htop -p $(pgrep nombre_proceso) # muestra solo los procesos nombrados.
-------- mientras top está abierto se puede usar:
p # para ordenar por uso de CPU.
m # para ordenar por uso de memoria.
k # para terminar un proceso especificando su PID.
r # para cambiar la prioridad de un proceso (requiere permisos de superusuario).
```

Para iniciar un proceso con un valor de prioridad especifico:
```bash
nice nombre_comando
nice -n valor nombre_comando # el valor está entre -20 y 19. 19 es el más bajo, -20 el de mayor prioridad.
nice -n 15 tar -czf archivo.tar.gz /home # Inicia el comando tar con una baja prioridad (15), permitiendo que otros procesos con mayor prioridad tengan preferencia en el uso de la CPU.
```

Para cambiar la prioridad de un proceso en ejecucion:
```bash
renice valor PID # cambia la prioridad del proceso al nuevo valor.
renice -5 1234 # ejemplo!.
```

Para ejecutar un proceso en segundo plano:
```bash
nombre_proceso &
sleep 60 & # inicia sleep que se ejecutará durante 60 segundos en segundo plano.
```

## Programacion de tareas periodicas

Para programar un mensaje o una tarea periódica:
```bash
crontab -e # para abrir el archivo crontab
# dentro del archivo crontab
* * * * * nombre_comando # los 5 * asteriscos definen la periodicidad, es decir:
[minuto] [hora] [día_del_mes] [mes] [día_de_la_semana] nombre_comando 
0 17 * * 0 df -h > /var/log/espacio_en_disco.log # ">" sirve para redirigir el comando.
0/10 * * * * nombre_comando # indica que el comando debe realizarse cada 10 minutos. 
```
Desglose sintáctico: 
- minuto: Rango de 0-59.
- hora: Rango de 0-23.
- día_del_mes: Rango de 1-31.
- mes: Rango de 1-12 o nombres abreviados (jan, feb, mar, etc.).
- día_de_la_semana: Rango de 0-7 (0 y 7 representan el domingo) o nombres abreviados (sun, mon, etc.).
- comando: El comando o script que se desea ejecutar.

Para listar las tareas programadas o eliminarlas:
```bash
crontab -l # para listar las tareas cron existentes
crontab -r # para eliminar todas las tareas cron para el usuario actual
```


## Programación de Tareas Puntuales 

Para programar tareas puntuales hay diferentes maneras:
```bash
comandos | at hora opciones
echo "hola mundo" | at 10:00 # ejemplo!
```
1. 10:00: A las 10:00 a.m.
2. now + 2 hours: Dentro de 2 horas a partir del momento actual.
3. midnight: Medianoche.
4. noon: Mediodía.

Otra forma de ejecutar tareas puntuales con **at** es:
```bash
at midnight < /ruta/script.sh # programa la ejecución de script.sh a la medianoche del día actual.
at now + 2 days < /ruta/script.sh # ejecuta el programa en 2 dias.
```

Para gestionar las tareas **at**:
```bash
atq # para ver la lista de tareas pendientes de ejecucion para el usuario actual.
atrm 2 # para eliminar la tarea programada 2.
```

Para gestonar las tareas de **cron**:
- /etc/cron.allow
- /etc/at.allow
Estos 2 archivos contienen una lista de usuarios permitidos para usar cron y at. Si el archivo existe, solo los usuarios especificados pueden programar tareas.

- /etc/cron.deny 
- /etc/at.deny
Estos 2 archivos contienen una lista de usuarios denegados para usar cron y at. Si el archivo existe y cron.allow no está presente, se deniega el acceso a los usuarios en la lista.
