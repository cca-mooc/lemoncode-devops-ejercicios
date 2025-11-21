# Ejercicios Módulo 2 - Contenedores

### Entregables

#### 📦 Reto 1: MongoDB en Contenedor
1. ✅ Comandos utilizados para crear la red Docker
```bash
❯ docker network create calendar-net
f45cf76d47ec1dcb2ef3d99bc5abef27e95c2d4676eb1e813b321cd37a9e34c7

lemon-exercises on  main [!?] 
❯ docker network ls
NETWORK ID     NAME           DRIVER    SCOPE
1ce97b7b5a90   bridge         bridge    local
f45cf76d47ec   calendar-net   bridge    local
87169e539555   host           host      local
f217cf256abc   minikube       bridge    local
6f564187a0a4   none           null      local
```
2. ✅ Comando para ejecutar el contenedor de MongoDB
```bash
❯ docker run -d --network calendar-net --name mongodb mongo:latest
bd48076fbf6aa11d517aea6da60f3b3624776124d19befea1e4a5162f9235ae8

❯ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS       NAMES
bd48076fbf6a   mongo:latest   "docker-entrypoint.s…"   5 seconds ago   Up 5 seconds   27017/tcp   mongodb

❯ docker network inspect calendar-net --format '{{json .Containers}}' | jq
{
  "bd48076fbf6aa11d517aea6da60f3b3624776124d19befea1e4a5162f9235ae8": {
    "Name": "mongodb",
    "EndpointID": "f469d9d6208bf0d0b1a2305fe90262a0631c63c4a8ee3631ccac2b7d551b46fa",
    "MacAddress": "02:42:ac:12:00:02",
    "IPv4Address": "172.18.0.2/16",
    "IPv6Address": ""
  }
}
```
3. ✅ Configuración de conexión del backend a MongoDB
4. ✅ Prueba REST Client mostrando peticiones exitosas (`backend/client.http`)

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