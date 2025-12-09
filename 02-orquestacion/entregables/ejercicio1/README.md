# Ejercicio 1: Despliegue del monolito sin estado

- Para que minikube "vea" la imagen que he creado en local: `minikube image load jaimesalas/lc-todo-monolith`
- Para aplicar los cambios: `kubectl apply -f ./`
- Para abrir el tunel: `minikube tunnel`
- Para ver la ip pública del servicio: `kubectl get svc todo-monolith`