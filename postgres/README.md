# Deploy SonarQube

## Generate Password
```
echo -n 'password' | base64
cGFzc3dvcmQ=
```

## Create Jenkins Deployment and Service
```
kubectl apply -f postgres-pvc.yaml
kubectl apply -f postgres-secret.yaml
kubectl apply -f postgres-deployment.yaml
kubectl apply -f nginx-shell.yaml
```

## Get Pods
```
kubectl get pods

NAME                           READY   STATUS    RESTARTS   AGE
postgres-db-57876dbf88-tb8gb   1/1     Running   0          76s
```

## Connect to DB
```
kubectl exec -it postgres-db-57876dbf88-tb8gb -- psql -h localhost -U postgres --password -p 5432 postgres

Password for user postgres:
psql (9.5.3)
Type "help" for help.

postgres=# 
```

## Connect to Shell
Get Pod Information
```
kubectl get pods

NAME                           READY   STATUS    RESTARTS   AGE
postgres-db-57876dbf88-tb8gb   1/1     Running   0          9m55s
bash-alpine                    1/1     Running   0          102s
```

login to pod, install psql and connect
```
kubectl exec --stdin --tty bash-alpine -- /bin/sh

/ # apk add --no-cache postgresql-client
/ #
/ # psql -h 192.16.1.4 -U adminuser --password -p 5432 postgres
Password: 
psql (12.4, server 9.5.3)
Type "help" for help.

postgres=# 
```
