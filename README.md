# kubernetes-DevOps-Labs
This is my collection of kubernetes manifests for DevOps/SRE related tasks. This should help out with basic proof of concepts in any cluster. For a scaled down setup, you can install [minikube](https://minikube.sigs.k8s.io/docs/start/). If you need a more robust system with control and access, take a look at [Kubernetes 3 node cluster setup](https://uonyekwuluje.github.io/2020-11-07/kubernetes-installation). Outside these, Azure AKS, AWS EKS or Google K8 should be fine

## Table of Content <br>
* [Postgres SQL](/postgres)
* [Jenkins](/jenkins)
* [Sonarqube](/sonarqube)
* [nginx](/nginx)

## Kubernetes Tips <br>
* **DNS:** Service discovery works by listening for events in Kubernetes. Each service will get its own record created in the format ```<serviceName>.svc.cluster.local```. All services in the Kubernetes environment are resolvable by **<serviceName>**. DNS resolutions are done on a per service basis in the format of ```<serviceName>.<namespaceName>.svc.cluster.local```
* Kubectl command line cheatsheet. [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
