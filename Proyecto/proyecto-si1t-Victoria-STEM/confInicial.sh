#!/bin/bash

# 1. Creacion de usuarios y directorios:

# 1.A Creacion de usuarios:
sudo useradd -m usuario1
sudo useradd -m usuario2
sudo useradd -m usuario3
sudo useradd -m usuario4
sudo useradd -m usuario5

# 1.B Creacion de directorios:
mkdir /home/compartido
mkdir /home/compartido/documentos 
mkdir /home/compartido/proyectos 
mkdir /home/compartido/backup

sudo groupadd grupo_compartido
sudo usermod -aG grupo_compartido usuario1
sudo usermod -aG grupo_compartido usuario2
sudo usermod -aG grupo_compartido usuario3
sudo usermod -aG grupo_compartido usuario4
sudo usermod -aG grupo_compartido usuario5

sudo chgrp grupo_compartido /home/compartido
sudo chgrp grupo_compartido /home/compartido/documentos
sudo chgrp grupo_compartido /home/compartido/proyectos
sudo chgrp grupo_compartido /home/compartido/backup


# 2. Creacion de archivos y asignacion de permisos:

# 2.A Creacion grupo Staff:
sudo groupadd staff
sudo touch /home/compartido/documentos/informe_general.txt
sudo chgrp staff /home/compartido/documentos/informe_general.txt
sudo chmod 060 /home/compartido/documentos/informe_general.txt

# 2.B Creacion de archivo, grupo y permisos:
sudo groupadd propietarios
sudo usermod -aG propietarios usuario1
sudo usermod -aG propietarios usuario2
sudo touch /home/compartido/proyectos/plan_proyecto.txt
sudo chgrp propietarios /home/compartido/proyectos/plan_proyecto.txt
sudo chmod 464 /home/compartido/proyectos/plan_proyecto.txt

# 2.C Creaion de notas_personales.txt en las carpetas personales de los usuarios y asignacion de propietario y permisos:
sudo touch /home/usuario1/notas_personales.txt
sudo chown usuario1 /home/usuario1/notas_personales.txt
sudo chmod 600 /home/usuario1/notas_personales.txt

sudo touch /home/usuario2/notas_personales.txt
sudo chown usuario2 /home/usuario2/notas_personales.txt
sudo chmod 600 /home/usuario2/notas_personales.txt

sudo touch /home/usuario3/notas_personales.txt
sudo chown usuario3 /home/usuario3/notas_personales.txt
sudo chmod 600 /home/usuario3/notas_personales.txt

sudo touch /home/usuario4/notas_personales.txt
sudo chown usuario4 /home/usuario4/notas_personales.txt
sudo chmod 600 /home/usuario4/notas_personales.txt

sudo touch /home/usuario5/notas_personales.txt
sudo chown usuario5 /home/usuario5/notas_personales.txt
sudo chmod 600 /home/usuario5/notas_personales.txt

# PRIMER INCREMENTO
# 1.A Creación de grupos y asignación de usuarios:

sudo groupadd admin
sudo groupadd colaboradores

sudo usermod -aG admin usuario1
sudo usermod -aG admin usuario2

sudo usermod -aG colaboradores usuario3
sudo usermod -aG colaboradores usuario4
sudo usermod -aG colaboradores usuario5


# 2.A Asignación de permisos:
sudo chmod 060 /home/compartido/documentos/informe_general.txt

# 2.B Asignación de permisos a diferentes grupos para un mismo archivo:
sudo setfacl -m g:admin:w /home/compartido/proyectos/plan_proyecto.txt
sudo setfacl -m g:colaboradores:r /home/compartido/proyectos/plan_proyecto.txt

# 3.A Mostrar procesos activos y guardar informe:
ps aux
mkdir /home/compartido/reportes
ps aux > /home/compartido/reportes/procesos.txt

# 3.B Configurar monitoreo de uso de CPU (en segundo plano) y guardar informacion: 
(crontab -l; echo "*/10 * * * * mpstat >> /home/compartido/reportes/cpu_usage.log") | crontab -
echo "Cron job añadido exitosamente."

# 4.A Configurar cron para hacer backup diario:
(crontab -l; echo "0 2 * * * tar -zcf /home/compartido/backup/backup.tar.gz /home/compartido/") | crontab -
echo "Cron job añadido exitosamente."

# 4.B Programo un mensaje para dentro de un mes para los usuarios:
echo "Actualiza tu archivo de notas personales." | at now + 1 month


# SEGUNDO INCREMENTO

# 1.A Asignacion de IP statica:

mkdir /etc/network/interfaces.d/

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.2 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo1

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.3 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo2

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.4 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo3

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.5 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo4

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.6 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo5

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.7 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo6

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.8 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo7

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.9 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo8

echo "auto emp0s3
  iface emp0s3 inet static
  address 192.168.10.10 
  netmask 255.255.255.0
  gateway 192.168.10.1
  dns-nameservers 8.8.8.8 8.8.4.4" > /etc/network/interfaces.d/equipo9

# 2.A Pruebas de conectividad:
sudo touch /home/compartido/reportes/red_interna.txt
ping -c 4 8.8.8.8 > /home/compartido/reportes/red_interna.txt
sudo apt install traceroute
traceroute -q 4 -m 1 >> /home/compartido/reportes/red_interna.txt 

# 3.A Intalacion de iftop:
sudo apt install iftop

# 3.B Ejecucion de iftop para monitoreo del trafico de red:
sudo timeout 3 iftop

# 3.C Guardar informe
sudo chmod 777 /home/compartido/reportes/ 
sudo iftop -t -s 10 > /home/compartido/reportes/trafico_red.log # este proceso puede tardar más de 10segundos en terminar de ejecutarse.
