# Prueba Técnica Práctica 3 (PT3)

### 1.1 Configuración de IP Estática:
```bash
sudo ifconfig enp0s3 192.168.50.100 netmask 255.255.255.0 
sudo ip addr show
```

### 1.2 Pruebas de conectividad:
```bash
ping -c 4 192.168.50.1
traceroute 8.8.8.8
```

### 1.3 Listar Servicios Activos:
```bash
ss -tuln
```

### 2.1 Crear Usuarios:
```bash
sudo adduser admin1
sudo adduser user1
sudo usermod -aG sudo admin1
```

### 2.2 Configurar Permisos de Carpeta Compartida:
```bash
sudo mkdir /home/compartido
sudo chmod 660 /home/compartido
```

### 3.1 Configurar SSH:
```bash
sudo apt install openssh-server -y 
sudo systemctl status ssh 
sudo systemctl start ssh
sudo systemctl enable ssh # el servicio SSH se inicia automaticamente con el sistema operativo.
ssh-keygen -t rsa -b 2048 
ssh-copy-id admin1@localhost # se copia la clave publica en el archivo del otro usuario.
ssh admin1@localhost # comprobacion de que puede conectarse con el sistema sin necesidad de contrasena.
```

### 3.2 Transferencia de Archivos:
```bash
sudo usermod -aG sudo user1
su - user1
echo "contenido de prueba" > informe.txt
scp /home/user1/informe.txt admin1@localhost:/home/admin1
sudo rsync informe.txt /home/compartido
```

### 4.1 Instalar y Configurar FTP:
```bash
sudo apt update # (1) Actualizacion del sistema.
sudo apt install vsftpd -y
sudo nano /etc/vsftpd.conf # (3) Entrar en el archivo
local_enable=YES 
anonymous_enable=YES
write_enable=NO
anon_root=/srv/ftp # (7) Luego se guarda y cierra el archivo.
sudo systemctl restart vsftpd
```

### 4.2 Transferir Archivo con FTP:
```bash
sudo adduser ftpuser 
sudo mkdir -p /home/ftpuser/ftp_files 
sudo chown ftpuser:ftpuser /home/ftpuser/ftp_files
touch catalogo.txt
sftp localhost # Lo he intentado con el ftp pero me pide una contraseña que desconozco, sin embargo, con el sftp si puedo realizar 'put' y 'get'.
get catalogo.txt
put catalogo.txt
```