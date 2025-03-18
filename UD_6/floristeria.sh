# 🌸 Relación de Ejercicios Prácticos - Floristería Celsaac 🌸

## 1. Configuración de Red y Diagnóstico

# Verifica la conexión del servidor de la floristería (ping).
ping -c 4 www.floristeriacaladium.es

# Consulta la dirección IP del servidor (ip a).
ip a

# Consulta la dirección MAC del router (ip neigh show).
ip neigh show

# Lista las interfaces de red disponibles en el servidor (ip link show).
ip link show

## 2. HTTP y Servicios de Red

# Verifica qué puertos están abiertos en el servidor (netstat).
netstat

# Realiza una solicitud GET al servidor (curl -I).
curl -I www.google.com
curl https://api.restful-api.dev/objects
curl https://api.restful-api.dev/objects/1 # con un id especifico.

curl https://api.restful-api.dev/objects/1

# Envía un pedido al servidor (curl -X POST).
curl -X POST

curl -X POST https://api.restful-api.dev/objects/1 
    -H "Content-Type: application/json" 
    -d '{
        "name":"Google Pixel 6 Pro",
        "data":{
            "color":"Cloudy White",
            "capacity":"128 GB"
        }
    }'

curl -X POST -d '{"name":"Google Pixel 6 Pro","data":{"color":"Cloudy White","capacity":"128 GB"}}' https://api.restful-api.dev/objects/1 -H "Content-Type: application/json"
curl -X POST -d '{"name":"Google Pixel 6 Pro","data":{"color":"Cloudy White","capacity":"128 GB"}}' -H "Content-Type: application/json" https://api.restful-api.dev/objects/1

# Modifica la cantidad disponible de un producto (curl -X PUT).
curl -X PUT -d '{"field":"value"}' -H "Content-Type: application/json" https://postman-echo.com/put

# Elimina un producto del catálogo (curl -X DELETE).
curl -X DELETE -d '{"field":"value"}' -H "Content-Type: application/json" https://postman-echo.com/delete

## 3. Seguridad y Análisis de Respuestas HTTP

# Prueba la seguridad de HTTPS (curl -I http).
curl -I https://www.floristeriacaladium.es/modules/homeslider/images/6bd857f6b0189a6f9401c211a766e639e15e54f2_BannerTest.png

# Consulta el contenido de una imagen sin descargarla (curl -I).
curl -I https://www.floristeriacaladium.es/modules/homeslider/images/6bd857f6b0189a6f9401c211a766e639e15e54f2_BannerTest.png


## 4. Pruebas de Red y Puertos

# Accede de forma segura al servidor (ssh, simulado).

# Verifica la configuración DNS del dominio (nslookup).
nslookup https://www.floristeriacaladium.es/

# Evalúa la disponibilidad del servidor (traceroute).
traceroute www.floristeriacaladium.es

### https://blog.marcnuri.com/curl-put-request-ejemplos