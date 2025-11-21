# Ejercicios Módulo 2 - Contenedores

## Entregables

### 📦 Reto 1: MongoDB en Contenedor
### 1. ✅ Comandos utilizados para crear la red Docker
```bash
❯ docker network create calendar-net
f45cf76d47ec1dcb2ef3d99bc5abef27e95c2d4676eb1e813b321cd37a9e34c7

❯ docker network ls
NETWORK ID     NAME           DRIVER    SCOPE
1ce97b7b5a90   bridge         bridge    local
f45cf76d47ec   calendar-net   bridge    local
87169e539555   host           host      local
f217cf256abc   minikube       bridge    local
6f564187a0a4   none           null      local
```
### 2. ✅ Comando para ejecutar el contenedor de MongoDB
```bash
❯ docker run -d --network calendar-net -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb mongo:latest
29005cd30d07062a392bd108baf2f94a556aa29211a6c330ec8feb19704c0234

❯ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                             NAMES
29005cd30d07   mongo:latest   "docker-entrypoint.s…"   6 seconds ago   Up 5 seconds   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongodb

❯ docker network inspect calendar-net --format '{{json .Containers}}' | jq
{
  "29005cd30d07062a392bd108baf2f94a556aa29211a6c330ec8feb19704c0234": {
    "Name": "mongodb",
    "EndpointID": "67614f46d0aee26b067dcea793683bd6d4a495b77b9891a556167deac020f8dd",
    "MacAddress": "02:42:ac:12:00:02",
    "IPv4Address": "172.18.0.2/16",
    "IPv6Address": ""
  }
}
```
### 3. ✅ Configuración de conexión del backend a MongoDB
Primero creo el fichero `.env`:
```env
DATABASE_URL=mongodb://admin:password@localhost:27017
DATABASE_NAME=LemoncodeCourseDb
HOST=localhost
PORT=5001
```

Después de instalar las dependencias ejecuto el backend:
```bash
❯ npm start

> lemoncode-backend@1.0.0 start
> node app.js


══════════════════════════════════════════════════════════════════════
🍋 LEMONCODE CALENDAR - BACKEND (Node.js + Express)
══════════════════════════════════════════════════════════════════════
🔄 Conectando a MongoDB...
✅ Conexión a MongoDB exitosa
📚 Colección Classes cargada
🚀 Servidor ejecutándose en: http://localhost:5001
📚 API: http://localhost:5001/api/classes
⏰ Hora: 21/11/2025, 10:43:50
══════════════════════════════════════════════════════════════════════
```

### 4. ✅ Prueba REST Client mostrando peticiones exitosas (`backend/client.http`)

<details>
<summary><strong>Log de las peticiones</strong></summary>

```http

Testing started at 10:51 ...
GET http://localhost:5001/api/classes

###

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 2
ETag: W/"2-l9Fw4VUO7kr8CvBlt4zaMCqXZ0w"
Date: Fri, 21 Nov 2025 09:51:47 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105147.200.json

Response code: 200 (OK); Time: 181ms (181 ms); Content length: 2 bytes (2 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores I",
  "instructor": "Gisela Torres",
  "startDate": "2025-10-17T18:00:00Z",
  "endDate": "2025-10-17T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 187
ETag: W/"bb-tRT3dB+jfG5E21WEwe0H2I3/duA"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148.201.json

Response code: 201 (Created); Time: 28ms (28 ms); Content length: 187 bytes (187 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores II",
  "instructor": "Gisela Torres",
  "startDate": "2025-10-24T18:00:00Z",
  "endDate": "2025-10-24T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 188
ETag: W/"bc-26kGi7eQUQ4tvDoRe9qq4L9qJp8"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-1.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 188 bytes (188 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores III",
  "instructor": "Gisela Torres",
  "startDate": "2025-10-31T18:00:00Z",
  "endDate": "2025-10-31T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 189
ETag: W/"bd-d9vFgJ3e0laSlVvg4vqbcMHMqrA"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-2.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 189 bytes (189 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores IV",
  "instructor": "Gisela Torres",
  "startDate": "2025-11-07T18:00:00Z",
  "endDate": "2025-11-07T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 188
ETag: W/"bc-yp13INjo5C6XB7bqpY5a++JN1Gw"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-3.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 188 bytes (188 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores V",
  "instructor": "Gisela Torres",
  "startDate": "2025-11-14T18:00:00Z",
  "endDate": "2025-11-14T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 187
ETag: W/"bb-11KWIrYzKTWBVvT9MlqXl+FXoyY"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-4.201.json

Response code: 201 (Created); Time: 5ms (5 ms); Content length: 187 bytes (187 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Contenedores VI",
  "instructor": "Gisela Torres",
  "startDate": "2025-11-21T18:00:00Z",
  "endDate": "2025-11-21T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 188
ETag: W/"bc-KDatEJVhWAKxnjrtP18pwSoySUY"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-5.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 188 bytes (188 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Azure Web Services I",
  "instructor": "Gisela Torres",
  "startDate": "2026-02-20T18:00:00Z",
  "endDate": "2026-02-20T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 193
ETag: W/"c1-DtsqmlVfU2uUddAHZ1Aq3ksjKcg"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-6.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 193 bytes (193 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Azure Web Services II",
  "instructor": "Gisela Torres",
  "startDate": "2026-02-27T18:00:00Z",
  "endDate": "2026-02-27T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 194
ETag: W/"c2-2w8APJViONSH0O+wQ6nvqIN34YE"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-7.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 194 bytes (194 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "Kubernetes AKS",
  "instructor": "Gisela Torres",
  "startDate": "2026-03-13T18:00:00Z",
  "endDate": "2026-03-13T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 187
ETag: W/"bb-ejr3DVzuo51eYHBXVeZPllysPOg"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-8.201.json

Response code: 201 (Created); Time: 7ms (7 ms); Content length: 187 bytes (187 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "SESIÓN IA I",
  "instructor": "Gisela Torres",
  "startDate": "2026-04-17T18:00:00Z",
  "endDate": "2026-04-17T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 185
ETag: W/"b9-gFLw/LZ4wKpTCrTpAvPyVMYed2U"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-9.201.json

Response code: 201 (Created); Time: 6ms (6 ms); Content length: 184 bytes (184 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "SESIÓN IA II",
  "instructor": "Gisela Torres",
  "startDate": "2026-04-24T18:00:00Z",
  "endDate": "2026-04-24T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 186
ETag: W/"ba-ET2j62W/XO30trThTPb3je+o2II"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-10.201.json

Response code: 201 (Created); Time: 5ms (5 ms); Content length: 185 bytes (185 B)


POST http://localhost:5001/api/classes
Content-Type: application/json

{
  "name": "SESIÓN IA III",
  "instructor": "Gisela Torres",
  "startDate": "2026-05-01T18:00:00Z",
  "endDate": "2026-05-01T20:00:00Z",
  "duration": 2,
  "level": "Beginner"
}

###

HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 187
ETag: W/"bb-xeu+snucfEEfFLqWlqrxsz4mVAw"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-11.201.json

Response code: 201 (Created); Time: 5ms (5 ms); Content length: 186 bytes (186 B)


GET http://localhost:5001/api/classes/

###

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 2272
ETag: W/"8e0-4P6kgRLYw5VLkYHuQqNhEzZPzWA"
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148.200.json

Response code: 200 (OK); Time: 15ms (15 ms); Content length: 2269 bytes (2,27 kB)


PUT http://localhost:5001/api/classes/
Content-Type: application/json

{
  "name": "Updated Class Name",
  "instructor": "New Instructor",
  "startDate": "2025-10-17T18:00:00Z",
  "endDate": "2025-10-17T20:00:00Z",
  "duration": 2,
  "level": "Intermediate"
}

###

HTTP/1.1 404 Not Found
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Security-Policy: default-src 'none'
X-Content-Type-Options: nosniff
Content-Type: text/html; charset=utf-8
Content-Length: 151
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148.404.html

Response code: 404 (Not Found); Time: 4ms (4 ms); Content length: 151 bytes (151 B)


DELETE http://localhost:5001/api/classes/

###

HTTP/1.1 404 Not Found
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Security-Policy: default-src 'none'
X-Content-Type-Options: nosniff
Content-Type: text/html; charset=utf-8
Content-Length: 154
Date: Fri, 21 Nov 2025 09:51:48 GMT
Connection: keep-alive
Keep-Alive: timeout=5


Response file saved.
> 2025-11-21T105148-1.404.html

Response code: 404 (Not Found); Time: 5ms (5 ms); Content length: 154 bytes (154 B)
```
</details>

#### 🐳 Reto 2: Dockerizar el Backend
1. ✅ Archivo `Dockerfile` del backend 
2. ✅ Comando para construir la imagen 
3. ✅ Comando para ejecutar el contenedor del backend
4. ✅ Prueba REST Client validando que la API responde correctamente

#### 🎨 Reto 3: Dockerizar el Frontend
1. ✅ Archivo `Dockerfile` del frontend
2. ✅ Comando para construir la imagen del frontend
3. ✅ Comando para ejecutar el contenedor del frontend
4. ✅ Archivo `.env` o variables de entorno configuradas correctamente


#### 🎪 Reto 4: Docker Compose
1. ✅ Archivo `compose.yml` completo y documentado con comentarios
2. ✅ Archivo `.env` (si es necesario) con variables de entorno
3. ✅ Comando `docker-compose up` ejecutándose exitosamente
4. ✅ Captura de pantalla de todos los servicios corriendo (`docker-compose ps`)
5. ✅ Captura de pantalla de la aplicación completa en `http://localhost:3000`