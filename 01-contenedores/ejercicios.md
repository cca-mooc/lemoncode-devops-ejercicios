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
PORT=5000
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
🚀 Servidor ejecutándose en: http://localhost:5000
📚 API: http://localhost:5000/api/classes
⏰ Hora: 21/11/2025, 10:21:39
══════════════════════════════════════════════════════════════════════
```

### 4. ✅ Prueba REST Client mostrando peticiones exitosas (`backend/client.http`)

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