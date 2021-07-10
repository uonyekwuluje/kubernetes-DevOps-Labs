# Deploy Apache2

## Create Apache2 Deployment and Service
```
kubectl apply -f apache2-deployment.yaml 
```
## Test
```
kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-574b87c764-k69jp   1/1     Running   0          9s
nginx-deployment-574b87c764-rkjcw   1/1     Running   0          9s

kubectl get svc

NAME            TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)        AGE
kubernetes      ClusterIP      192.17.0.1       <none>         443/TCP        9m39s
nginx-service   LoadBalancer   192.17.236.145   20.185.102.4   80:31176/TCP   40s


kubectl port-forward pods/nginx-deployment-574b87c764-k69jp 7000:80
OR
kubectl port-forward service/nginx-service 7000:80

# Loginto Browser
http://localhost:7000
```

## Delete Deployment
```
kubectl delete -f apache2-deployment.yaml
```
