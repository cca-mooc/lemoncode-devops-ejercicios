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
- `minikube addons enable ingress` -> Enable ingress controller
  - `kubectl get pods -n ingress-nginx` -> Verify it is working
  - `kubectl get ingress -n nwp` -> to list ingresses in the namespace
- `kubectl get ns` -> list namespaces
- `kubectl apply -f ./` -> apply changes in all the files
- `kubectl get pods -n nwp` -> List pods in the namespace
- `kubectl get events -n nwp --sort-by=.metadata.creationTimestamp` -> To wonder why containers are being restarted
- `kubectl describe pod optimizer-64997fd79c-r95vh -n nwp` describe a pod
- `kubectl logs -n nwp optimizer-77dcdfb5f-fcv5q --tail=50` check the logs of a container
- `kubectl exec -n nwp optimizer-77dcdfb5f-fcv5q -- sh -c "wget -T 2 -O- http://localhost:3000/v1/health 2>&1"` execute a command inside the container
- `kubectl get endpoints -n nwp nwp-client` -> get the client endpoints.
- `kubectl delete deployment nwp-client -n nwp` -> Delete a deployment
- `kubectl delete ingress nwp-ingress -n nwp` -> Delete the ingress
- `kubectl port-forward -n nwp svc/nwp-client 8080:80 &` -> Open a port forward tunnel to the client

## Setup and Access

After starting minikube and applying the configuration files:

1. **Enable the ingress addon** (if not already enabled):
   ```bash
   minikube addons enable ingress
   ```

2. **Wait for the ingress controller to be ready**:
   ```bash
   kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
   ```

3. **Apply all configuration files**:
   ```bash
   kubectl apply -f ./
   ```

4. **Access the application locally**:
   
   Since NodePort services don't work directly with Minikube on macOS/Docker driver, use port-forwarding to access the ingress controller:
   
   ```bash
   kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
   ```

5. **Open the application**:
   - **NWP Client**: http://localhost:8080/
   - **Optimizer API**: http://localhost:8080/api/v1/health
