# Deploy MySQL

### Generate Password
```
echo -n 'password' | base64
cGFzc3dvcmQ=
```

### Create MySQL Stack
```
kubectl apply -f mysql-deployment.yaml
```

### Destroy MySQL Stack
```
kubectl delete -f mysql-deployment.yaml
```

### Connect to DB from Inside Kubernetes
Connect by loggin into service
```
kubectl exec -it svc/mysql-svc -n mysql-ns bash
mysql -u root -ppassword
```

### Connect to DB from outside kubernetes
```
kubectl exec -it svc/mysql-svc -n mysql-ns -- mysql -u root -ppassword

Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 116
Server version: 5.6.51 MySQL Community Server (GPL)

Copyright (c) 2000, 2021, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```
