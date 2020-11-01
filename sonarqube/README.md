# Deploy SonarQube

## Create Jenkins Deployment and Service
```
kubectl apply -f sonarqube-namesapce.yaml
kubectl apply -f sonarqube-pvc.yaml
kubectl apply -f sonarqube-postgres-secret.yaml

```

## Test
```
kubectl get pods -n jenkins
NAME                                 READY   STATUS    RESTARTS   AGE
jenkins-deployment-7f5874c7f-cnzbv   1/1     Running   0          24s

kubectl get svc -n jenkins
NAME              TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)          AGE
jenkins-service   LoadBalancer   192.17.211.114   40.76.149.110   8080:31290/TCP   29s
```

# Login to Browser
```
http://40.76.149.110:8080
```
