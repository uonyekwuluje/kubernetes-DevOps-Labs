# Deploy Apache2

## Create Apache2 Deployment and Service
```
kubectl apply -f apache2-deployment.yaml 
```
## Test
```
kubectl get pods -n apache2
>>
NAME                                  READY   STATUS    RESTARTS   AGE
apache2-deployment-7f8546b48f-cmwv4   1/1     Running   0          6m20s

kubectl get svc -n apache2
>>
NAME              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
apache2-service   ClusterIP   10.43.170.94   <none>        8098/TCP   7m4s

kubectl port-forward svc/apache2-service 8080:8098 -n apache2
http://localhost:8080
OR
kubectl port-forward service/nginx-service 7000:80

# Loginto Browser
http://localhost:7000
```

## Delete Deployment
```
kubectl delete -f apache2-deployment.yaml
```
