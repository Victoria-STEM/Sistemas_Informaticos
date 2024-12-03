# Unidad Didáctica 3: Redes en Linux. TCP/IP. Modelo OSI
Una red se define como un conjunto de dispositivos interconectados que comparten recursos e información. 


## Componentes Principales de una Red:
1. Dispositivos de Red: Incluyen servidores, clientes, routers, switches y puntos de acceso, entre otros.

2. Medios de Transmisión: Pueden ser cables (cobre, fibra óptica) o medios inalámbricos (Wi-Fi, Bluetooth).

3. Protocolos de Comunicación: Reglas que rigen el intercambio de datos, como TCP/IP, UDP, HTTP, SSH, etc.

4. Servicios de Red: Aplicaciones que permiten la transmisión de información, como DNS, DHCP y FTP.


## Definiciones básicas:
1. *IP (Protocolo de Internet)* es un *identificador único* que se asigna a un dispositivo dentro de una red. 

2. *Una máscara de red* (o máscara de subred) es un número que define qué parte de una dirección IP corresponde a la red y qué parte identifica al host (dispositivo específico) dentro de esa red.
    - Notación decimal: 255.255.255.0
    - Notación CIDR: /24 

3. Una *interfaz de red* es el punto de conexión entre un dispositivo y la red. Puede ser un hardware físico (como una tarjeta de red o un puerto Ethernet) o una interfaz virtual (como una conexión VPN o loopback).
    - Interfaces físicas: eth0, wlan0 (en Linux), Wi-Fi, Ethernet (en Windows).
    - Interfaces virtuales: lo (loopback), tun0 (VPN).


### Ejemplo práctico:
1. *Interfaz de red*:
    - Piensa en la interfaz como un puerto físico (como el cable Ethernet conectado a tu computadora) o virtual. Ejemplo: `eth0`, `emp0s3`, `lo`, ...

2. *Dirección IP*:
    - Es el identificador único de un dispositivo y la interfaz tiene asignada una dirección IP, como `192.168.1.100`.

3. *Máscara de red*:
    - La dirección IP, junto con la máscara de red `255.255.255.0`, indica que el dispositivo pertenece a la red 192.168.1.0/24. La red tiene 256 direcciones posibles (192.168.1.0 a 192.168.1.255).


## Los comandos principales para la gestión de IP incluyen:
- `ifconfig`: Herramienta clásica para la configuración de interfaces de red.
- `ip`: Comando más moderno y versátil que reemplaza ifconfig.
- `nmcli`: Comando para gestionar configuraciones de red usando NetworkManager.

```bash
ifconfig # para mostrar las ips.
ifconfig enp0se # para ver la configuracion de una interfaz específica.
ip link show # para mostrar las IPs.
ip addr show # para mostrar las direcciones IP detalladas.
nmcli connection show # muestra las connexiones con nmcli.
```

## Asignación de IP Estáticas y Dinámicas (DHCP)
- *IP Estática*: Se asigna *manualmente* en la configuración de la interfaz.

```bash
sudo ifconfig mascara_red direccion_IP netmask 255.255.255.0 # para configurar de forma especifica una IP con ifconfig.
_______
sudo ip addr add 192.168.1.100/24 dev emp0s3 
# anade la IP 192.168.1.100 a la interfaz de red emp0s3. /24 equivale a la mascara de red 255.255.255.0 . Este cambio es TEMPORTAL porque al reiniciar el sistema se pierde la configuración.

auto emp0s3
iface emp0s3 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
# esto es lo mismo, pero para una configuracion PERMANENTE! Esta orden se escribe en el archivo de red >> /etc/network/interfaces donde se configura y se inicializa cada vez que se reinicie el sistema.
_______

sudo ip addr del 192.168.1.100/24 dev emp0s3 # elimina la direccion IP asignada.

sudo nmcli connection add type ethernet ifname eth0 con-name NombreConexion ipv4.addresses 192.168.2.10/24 ipv4.gateway 192.168.2.1 # crea una NUEVA conexion ethernet para eth0 que se llama NombreConexion con ip y mascara de red en nmcli y es ESTÁTICA.
sudo nmcli connection up NombreConexion # activa la conexion.
sudo nmcli connection down NombreConexion # desactiva la conexion.
sudo nmcli connection delete NombreConexion # elimina la conexion.
sudo nmcli con mod emp0s3 ipv4.addresses 192.168.1.101/24 # MODIFICA una conexion IP que YA EXISTENTE con nmcli.
sudo nmcli con up emp0se # comprobacion con nmcli

sudo systemctl restart NetworkManager # reiniciar la red
sudo systemctl restart systemd-networkd # reiniciar la red.
```


- *IP Dinámica*: Asignada *automáticamente* por un servidor DHCP.

```bash
sudo dhclient enp0s3 # asigna de forma DINAMICA y TEMPORAL una IP a una interfaz concreta.
iface ens33 inet dhcp # agrega o ajusta una configuracion de red de forma permanente y asigna una IP automáticamente y no fija.
```

## Diagnóstico y Solución de Problemas de Red en Linux
- `ping`: Comprueba la conectividad con otro dispositivo.
- `traceroute` y `tracepath`: Muestra la ruta seguida por los paquetes.
- `netstat` y `ss`: Monitorea conexiones activas y puertos en uso.

```bash
ss -tuln # para listar las conexiones activos y los servicios que usan TCP/IP.
ss -t state established '( sport = :22 )' # muestra las conexiones IP activas en el puerto indicado.
ping www.google.com # se puede usar con webs.
ping -c 4 192.168.1.1 # envia 4 paquetes a esa direccion de IP.
traceroute google.com # potente y configurable pero requiere permisos. 
tracepath google.com # mas simple, sin permisos adicionales y rápido. 
netstat -tuln # muestra información sobre las conexiones de red activas y los puertos en escucha en tu sistema.
```

# Transferencia de archivos:

## Herramientas para la Transferencia de Archivos en Linux
- `scp`: Copia archivos de forma segura entre hosts.
- `rsync`: Sincroniza archivos y directorios de manera eficiente.
- `ftp`: Protocolo de transferencia de archivos. Se usa para conexiones no seguras.


## Configuración Básica de un Servidor FTP en Linux
1. Instalación de un servicio FTP (vsftpd o proftpd).
2. Configuración de usuarios y permisos.
3. Gestión de seguridad y acceso.


# Conexiones Remotas:

## Conexión Remota y Administración de Sistemas
- `ssh`: Protocolo para conexiones remotas seguras, utiliza cifrado para proteger la sesión.
- `telnet`: Protocolo básico para acceder a dispositivos de red, pero sin cifrado.
- `sftp`: Protocolo basado en SSH para transferencias seguras de archivos.

```bash

telnet www.example.com 80 # comprueba la conexion TCP con el puerto 80 (este puerto puede variar).
```