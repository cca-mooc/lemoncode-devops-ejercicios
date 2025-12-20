# Ejercicio 2: Monolito con base de datos

- Tuve que crear la imagen porque utilizo un macbook para los ejercicios. 
Llamé a la imagen todo-db:latest
```bash
cd entregables/01-monolith/todo-app
docker build -f ./Dockerfile.todos_db -t todo-db:latest .
```
- Para que minikube "vea" la imagen que he creado en local: `minikube image load todo-db:latest`
- Además he tenido que indicar que nunca intente hacer pull para que no entre en PullBackoff
- Tras aplicar los cambios:
```bash
❯ kubectl get pods
NAME                             READY   STATUS    RESTARTS      AGE
todo-db-0                        1/1     Running   0             29s
```