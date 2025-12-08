# k8s playground

This is just a playground to practice.

At first it has a deployment for the Night Watch Planner pet project. It has a backend called _optimizer_ and a client.
The client runs in the browser so both _optimizer_ and _client_
must be exposed and they will not communicate between each other.

## Useful kubectl and minikube commands

- `minikube ip` -> to know the minikube ip where nodePort services will be exposed.
- `minikube addons list` -> to list the addons so we can enable ingress controller, and stats pod.
  - `minikube addons enable metrics-server` -> to enable the metrics server addon.
    - `kubectl get pods -n kube-system` -> to ensure the addon pod is up and running
    - `kubectl top pods -n nwp` -> see resource consumption in the namespace
- `kubectl get ns` -> list namespaces
- `kubectl apply -f ./` -> apply changes in all the files
- `kubectl get pods -n nwp` -> List pods in the namespace
- `kubectl get events -n nwp --sort-by=.metadata.creationTimestamp` -> To wonder why containers are being restarted
- `kubectl describe pod optimizer-64997fd79c-r95vh -n nwp` describe a pod
- `kubectl logs -n nwp optimizer-77dcdfb5f-fcv5q --tail=50` check the logs of a container
- `kubectl exec -n nwp optimizer-77dcdfb5f-fcv5q -- sh -c "wget -T 2 -O- http://localhost:3000/v1/health 2>&1"` execute a command inside the container
