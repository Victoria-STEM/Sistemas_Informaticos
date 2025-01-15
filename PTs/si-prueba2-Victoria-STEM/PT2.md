
# Examen Práctico - Unidad Didáctica 2: Gestión de Procesos y Administración de Usuarios y Grupos


## Ejercicio 1: Configuración de Permisos

1. Cambia los permisos del archivo `reporte.txt` para que solo el usuario propietario pueda leer y escribir, y nadie más pueda acceder.
```bash
sudo chmod 600 reporte.txt
```

2. Describe cómo afectaría la configuración de permisos si usáramos el comando `chmod 777 reporte.txt`.
El propietario, grupo y otros usuarios podrian leer, escribir y ejecutar el archivo.


## Ejercicio 2: Gestión de Propiedad de Archivos

1. Cambia el propietario del archivo `data.csv` a `usuario1` y el grupo a `grupo1`.
```bash
sudo chown usuario1:grupo1 data.csv
```

2. Muestra cómo verificar la propiedad y los permisos del archivo después del cambio.
```bash
ls -l data.csv
```

3. Explica cómo restringir el acceso al archivo `data.csv` solo para el propietario y el grupo.
```bash
sudo chown 770 data.csv # de esta forma solo el propietario y el grupo pueden leer, modificar o cambiar el archivo data.csv, mientras que los otros usuarios tienen acceso nulo.
```


## Ejercicio 3: Creación y Gestión de Usuarios

1. Crea un nuevo usuario llamado `nuevo_usuario` con un directorio home en `/home/nuevo`.
```bash
sudo adduser --home /home/nuevo nuevo_usuario
```

2. Cambia la shell predeterminada de `nuevo_usuario` a `/bin/zsh`.
```bash
sudo usermod -s /bin/zsh nuevo_usuario
```


## Ejercicio 4: Control de Acceso de Usuario

1. Configura al usuario `fernando_alonso` para que solo pueda ejecutar el comando `cp` usando `sudo` sin necesidad de contraseña.
```bash
sudo visudo # para entrar en el archivo sudoers.
# Dentro del archivo sudoers:
fernando_alonso ALL=(ALL) NOPASSWD: /sbin/cp
```


## Ejercicio 5: Gestión de Grupos

1. Crea un grupo llamado `dev_team`.
```bash
sudo groupadd dev_team
```

2. Añade al usuario `nuevo_usuario` al grupo `dev_team` y muestra cómo verificar su pertenencia al grupo.
```bash
sudo usermod -aG dev_team nuevo_usuario
getent group dev_team
```


## Ejercicio 6: Seguridad de Contraseñas

1. Configura la política de contraseñas para requerir un mínimo de 12 caracteres, al menos dos dígitos y una letra mayúscula.
```bash
nano /etc/pam.d/common-password # para entrar en el archivo de las contrasenas.
# Dentro del archivo:
password requisite pam_pwquality.so minlen=12 ucredit=-1 dcredit=-2
```

2. Fuerza al usuario `fernando_alonso` a cambiar su contraseña en el próximo inicio de sesión.
```bash
sudo passwd -e fernando_alonso
```


## Ejercicio 7: Monitoreo de Procesos

1. Utiliza `top` para mostrar los procesos que consumen más recursos de CPU y explica cómo terminar un proceso desde `top`.
```bash
top # para abrir top.
# Dentro de top:
P # para ordenar por uso de CPU.
k # para indicar que quieres terminar un proceso.
PID # para indicar que proceso quieres terminar.
-15 # para enviar una señal amable de terminacion de proceso.
```

2. Utiliza `htop` para mostrar los procesos y explica cómo terminar un proceso desde `htop`.
```bash
htop # para abrir htop.
# Dentro de htop con las flechas te colocas sobre el proceso que quieres terminar.
k # Pulsas "k" para solicitar su terminacion.
# Seleccionas el tipo de terminacion que desees, en este caso 15 SIGTERM y presionas "enter" para terminarlo de forma amable.
```


## Ejercicio 8: Programación de Tareas con Cron

1. Escribe una tarea cron para ejecutar `backup.sh` a las 2:00 AM todos los domingos.
```bash
crontab -e # para abrir el archivo crontab.
# Dentro de crontab:
0 2 * * 7 ./backup.sh # habria que ajustar la ruta de encontrarse el archivo en otro lugar.
```

2. Verifica que la tarea cron se ha configurado correctamente.
```bash
crontab -l
```

3. Configura una tarea cron para ejecutar `log_cleanup.sh` cada primer lunes de mes a las 1:00 AM y redirige su salida a un archivo de log.
```bash
crontab -e
# Dentro de crontab:
0 1 (1-7) * 1 ./log_cleanup.sh > /var/log/archivo.log 
```


## Ejercicio 9: Programación de Tareas Puntuales con `at`

1. Programa una tarea usando `at` para ejecutar `script.sh` a las 10:00 PM hoy.
```bash
echo "./script.sh" | at 22:00
```

2. Muestra cómo listar todas las tareas programadas con `at`.
```bash
atq
```


## Ejercicio 10: Administración Avanzada de Usuarios y Grupos

1. Elimina al usuario `temp_user` usando `deluser`.
```bash
sudo deluser temp_user
```

2. Crea un grupo llamado `web_admins` usando `groupadd`.
```bash
sudo groupadd web_admins
```

3. Modifica el grupo `web_admins` para cambiar su GID a 4000 usando `groupmod`.
```bash
sudo groupmod -g 4000 web_admins
```

4. Configura ALIAS en sudoers para agrupar varios comandos bajo un solo nombre.
```bash
sudo visudo # para abrir sudoers.
# Dentro de sudoers: 
Cmnd_Alias SHUTDOWN_CMDS = /sbin/shutdown, /sbin/reboot
```

5. Configura ALIAS en sudoers para agrupar varios usuarios bajo un solo nombre y asignarles permisos específicos.
```bash
sudo visudo # para abrir sudoers
# Dentro de sudoers: 
User_Alias ADMINS = juan, carlos, maria # así se crea el alias y sus integrantes.
ADMINS ALL=(ALL) SHUTDOWN_CMDS # así se asignan los comandos designados en el ejercicio anterior, al alias.
```
