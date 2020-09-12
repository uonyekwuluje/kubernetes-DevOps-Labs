### 
## Deploy HAProxy Ingress
Download and install haproxy ingress
```
wget https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml
# NOTE: Edit haproxy-ingress.yaml and change NodePort to LoadBalancer for service
```

## Test
```
kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-574b87c764-k69jp   1/1     Running   0          9s
nginx-deployment-574b87c764-rkjcw   1/1     Running   0          9s

kubectl get svc
NAME            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
kubernetes      ClusterIP   192.17.0.1       <none>        443/TCP   22m
nginx-service   ClusterIP   192.17.133.164   <none>        80/TCP    4m51s

kubectl port-forward pods/nginx-deployment-574b87c764-k69jp 7000:80
OR
kubectl port-forward service/nginx-service 7000:80

# Loginto Browser
http://localhost:7000
```
