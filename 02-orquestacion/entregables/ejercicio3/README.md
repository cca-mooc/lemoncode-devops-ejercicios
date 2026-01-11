# Ejercicio 3. Aplicación Distribuida

## Paso 1 - Crear todo-front-distributed
- Creo la imagen arm64 y la inyecto en minikube:
  - `docker build -f ./Dockerfile -t todo-front-distributed:latest .`
  - `minikube image load todo-front-distributed:latest`
- Creo el deployment en [./todo-front-distributed-deploy.yml](./todo-front-distributed-deploy.yml) 
- Creo el cluster IP service [./todo-front-distributed-svc.yml](./todo-front-distributed-svc.yml) 