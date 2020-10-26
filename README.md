# kubernetes-DevOps-Labs
This is my kubernetes manifest collection of DevOps/SRE tools for Labs, Exams and Certification. I also leverage them heavily for my containerized infrastructure initiatives  

## Nginx Ingress Controller
[Kubernetes Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/)

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx \
  -l app.kubernetes.io/name=ingress-nginx --watch
```

## HAProxy Ingress Controller
[Kubernetes HAproxy Ingress Controller](https://haproxy-ingress.github.io/)
[Install Kubernetes HAproxy Ingress Controller](https://www.haproxy.com/documentation/kubernetes/latest/installation/kubernetes/)
```
kubectl apply -f https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml
OR
wget https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml
# Change controller.service.type=NodePort to controller.service.type=LoadBalancer
```
* Verify Installation
```
kubectl get ns
NAME                 STATUS   AGE
default              Active   92m
haproxy-controller   Active   24s
kube-node-lease      Active   92m
kube-public          Active   92m
kube-system          Active   92m
```
Verify Ingress:
```
kubectl get svc -n haproxy-controller
NAME                      TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)                                     AGE
haproxy-ingress           LoadBalancer   192.17.225.140   104.45.178.15   80:30291/TCP,443:32376/TCP,1024:31100/TCP   15m
ingress-default-backend   ClusterIP      192.17.184.138   <none>          8080/TCP                                    15m

curl 104.45.178.15
```


## SSL Certificate Update
Generate Signed SSL certificate and perform the following
* Create a new file with your SSL Certificate, Root CA and or Intermediate CA
* Convert that file to pem format
```
openssl x509 -in cert.crt -out cert.pem
```
Create new ssl secret
```
kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
```


## Converting Passwords to base64
```
echo -n '1dBl#HiIjLAiTSLG' | base64
```
Update your kubernetes secrets with the base64 output


## Kubernetes Tests
* Get Pods and Service
```
kubectl get pods
kubectl get svc
```

* Test Servicie/Pod:
```
# Forward pod/service port 9000 to localhost 7000
kubectl port-forward pods/<pod_name> 7000:9000
kubectl port-forward service/<service_name> 7000:9000

```
