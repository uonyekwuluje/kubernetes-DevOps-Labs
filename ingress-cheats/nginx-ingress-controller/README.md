# Nginx Ingress Controller

Nginx: https://kubernetes.github.io/ingress-nginx/deploy/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/cloud/deploy.yaml

kubectl get pods -n ingress-nginx \
  -l app.kubernetes.io/name=ingress-nginx --watch


kubectl apply -f sonarqube-pvc.yaml
kubectl apply -f sonarqube-postgres-secret.yaml
kubectl apply -f sonarqube-deployment.yaml
kubectl apply -f sonarqube-service.yaml
kubectl apply -f sonarqube-ingres.yaml



Test Install
----------------
kubectl port-forward pods/sonarqube-6995475bbb-cnw59 7000:9000
kubectl port-forward service/sonarqube 7000:9000


Get IP for Ingress Controller
--------------------------------
kubectl get ns
>>
NAME              STATUS   AGE
default           Active   78m
ingress-nginx     Active   12m
kube-node-lease   Active   78m
kube-public       Active   78m
kube-system       Active   78m

kubectl get svc -n ingress-nginx
>>
NAME                                 TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.0.205.176   40.88.132.11   80:30767/TCP,443:31467/TCP   12m
ingress-nginx-controller-admission   ClusterIP      10.0.58.54     <none>         443/TCP                      12m


Update Akamai
---------------------------
40.88.132.11  sonarqube.nuancecdi.com

kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
kubectl create secret tls sonar-tls-cert --key nuancecdi.key --cert nuancecdi.pem

