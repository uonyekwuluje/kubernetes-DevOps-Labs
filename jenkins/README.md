# Deploy Jenkins

## Create Jenkins Deployment and Service
```
kubectl apply -f jenkins-deployment.yaml
```

## Test
```
kubectl get pods -n jenkins
NAME                                 READY   STATUS    RESTARTS   AGE
jenkins-deployment-78994c874-hhc7l   1/1     Running   0          5m58s

kubectl get svc -n jenkins
NAME              TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
jenkins-service   ClusterIP   10.43.216.5   <none>        8080/TCP   11s

# Retrieve Jenkins Password
kubectl exec -it jenkins-deployment-78994c874-hhc7l bash -n jenkins
cat /var/jenkins_home/secrets/initialAdminPassword

# Forward Port
kubectl port-forward --address 0.0.0.0 svc/jenkins-service -n jenkins 8080
```

# Login to Browser
```
http://localhost:8080
```
