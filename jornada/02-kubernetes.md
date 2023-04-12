#Autor: Fagner Geraldes Braga  
#Data de criação: 11/04/2023  
#Data de atualização: 11/04/2023  
#Versão: 0.01

# Devops

## Ciclo de vida Devops
	Planejamento (Jira, Notion, Trello, Slack, Azure Devops)
	Codificação (git, github, gitlab)
	Construção (Maven, npm, nugget, docker, jenkins, github actions, gitlab ci)
	Teste (junity, nunity, sonarQube)
	Empacotamento
	Deploy (terraform, ansbible, aws, azure, google)
	Operação (kubernetes)
	Monitoramento (prometeus, grafana, jaeger, elastic)

## Kubernetes
	Resiliência
	Escalabilidade
	Balanceamento de carga

	Service Discovery
	Self Healing
	Estratégias de atualização

### Control Plane - Gerencia os nodes e gerencia o cluster
	api-server, scheduler, etcd, controller-manager

### Worker Node - executa os contêineres
	kubelet, kube-proxy, container runtime

### É preciso ter pelo menos 2 Control Planes no ambiente

### Quais elementos fazem parte do control plane? 
	api-server, scheduler, etcd, controller-manager

### Quais são os elementos usados pra fazer um deploy eficiente no Kubernetes?
	Pod - menor elemento do cluster
	ReplicaSet 
	Deployment 
	Service

## Cluster Kubernetes

### On-Premise 
	Recomendado ter equipe para implementar e manter
	Precisa gerenciar todo o ambiente

		kubeadm
		MicroK8s
		K3S
		RKE
		Kubespray

### Kubernetes as a Service
	Azure
	AWS
	Google
	Oracle
	Digital Ocean
	Linode

### Local
	Minikube
	MicroK8s
	K3S
	Kind
	K3D

## Ambiente
	Docker
	K3D
	Kubectl

## Instalação - Windows
### Chocolatey
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
```powershell
# k3d
choco install k3d
```

```powershell
# kubectl
choco install kubernetes-cli
```

### Instalação Linux

```bash
# k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

```bash
# kubectl
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```
## Criação do Cluster Kubernetes
```bash
# cria cluster
k3d cluster create

# mostra os nodes
kubectl get nodes

# arquivo de configuração do cluster
cat .\.kube\config

# lista contêiner docker
docker container ls

# lista os clusters
k3d cluster list

# remove o cluster
k3d cluster delete

# cria cluster sem load balance
k3d cluster create --no-lb

# cria cluster com nome 
k3d cluster create meucluster

# remove cluster com nome
k3d cluster delete meucluster

# cria cluster com 3 servers e 3 agentes
k3d cluster create meucluster --servers 3 --agents 3

k3d cluster delete meucluster

k3d cluster create meucluster

kubectl api-resources
```
### pod.yaml
	apiVersion: v1
	kind: Pod
	metadata:
	name: meupod
	spec:
	containers:
	- name: site
		image: fagnerfgb/web-page:blue
		ports:
		- containerPort: 80

```bash
# cria e/ou atualiza pod
kubectl apply -f .\pod.yaml

#cria pod
kubectl create -f .\pod.yaml

# lista os nós
kubectl get nodes

# lista os pods
kubectl get pods

kubectl describe pods meupod

# acessar o pod
# redirecionamento de portas
kubectl port-forward pod/meupod 8080:80

# remove o pod
kubectl delete pod meupod
```

### pod.yaml
	apiVersion: v1
	kind: Pod
	metadata:
	name: meupod-azul
	labels:
		cor: azul
	spec:
	containers:
	- name: site
		image: fabricioveronez/web-page:blue
		ports:
		- containerPort: 80
	---
	apiVersion: v1
	kind: Pod
	metadata:
	name: meupod-verde
	labels:
		cor: verde
	spec:
	containers:
	- name: site
		image: fabricioveronez/web-page:blue
		ports:
		- containerPort: 80

```bash
kubectl apply -f .\pod.yaml
kubectl get pods
kubectl get pods -l cor=azul

# ReplicaSet
# Réplicas desejadas = réplicas corrente

kubectl delete -f .\pod.yaml
```

### replicaset.yaml
	apiVersion: apps/v1
	kind: ReplicaSet
	metadata:
	name: meureplicaset
	spec:
	replicas: 5
	selector:
		matchLabels:
		app: web
	template:
		metadata:
		labels:
			app: web
		spec:
		containers:
		- name: site
			image: fabricioveronez/web-page:blue
			ports:
			- containerPort: 80

```bash
kubectl apply -f .\replicaset.yaml
kubectl get pods
kubectl get replicaset
kubectl describe replicaset meureplicaset
kubectl delete pod meureplicaset-s6xj4
kubectl get pods
kubectl delete -f .\replicaset.yaml
```

### deployment.yaml
	apiVersion: apps/v1
	kind: Deployment
	metadata:
	name: meudeployment
	spec:
	replicas: 1
	selector:
		matchLabels:
		app: web
	template:
		metadata:
		labels:
			app: web
		spec:
		containers:
		- name: site
			image: fabricioveronez/web-page:blue
			ports:
			- containerPort: 80
```bash
kubectl apply -f .\deployment.yaml
kubectl get pods
kubectl get replicaset
kubectl describe pod meudeployment-6449749bdd-rjwmv
kubectl get replicaset
kubectl rollout undo deployment meudeployment
kubectl get pods
kubectl port-forward pod/meudeployment-7d69fc7db9-7n9fh 8080:80
```
## Tipos de Service
	ClusterIP (Só para comunicação interna)
	NodePort (Externo) 30000-32767
	LoadBalancer

### deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: meudeployment
spec:
  replicas: 10
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: site
        image: fabricioveronez/web-page:green
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: web-page
spec:
  selector:
    app: web
  ports:
    - port: 80
      protocol: TCP
      nodePort: 30000
  type: NodePort
```bash
kubectl apply -f .\deployment.yaml
kubectl get service
kubectl port-forward service/web-page 8080:80

k3d cluster delete meucluster
k3d cluster create meucluster -p "80:30000@loadbalancer"
kubectl get nodes
kubectl get pods
docker container ls
kubectl apply -f .\deployment.yaml
kubectl get service

k3d cluster delete meucluster
k3d cluster create meucluster -p "80:30000@loadbalancer"

git clone https://github.com/fagnerfgb/kube-news.git
kubectl get nodes
cd kube-news/src
```
### Dockerfile
	FROM  node:18.11.0
	WORKDIR /app
	COPY package*.json ./
	RUN npm install
	COPY . .
	EXPOSE 8080
	CMD ["node","server.js"]
```bash
docker build -t fagnerfgb/kube-news:v1 .
docker image ls
docker push fagnerfgb/kube-news:v1

docker tag fagnerfgb/kube-news:v1 fagnerfgb/kube-news:latest
docker push fagnerfgb/kube-news:latest
```
cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\kube-news\"
mkdir k8s
cd k8s

### deployment.yaml
	apiVersion: apps/v1
	kind: Deployment
	metadata:
	name: postgre
	spec:
	selector:
		matchLabels:
		app: postgre
	template:
		metadata:
		labels:
			app: postgre
		spec:
		containers:
		- name: postgre
			image: postgres:15.0
			ports:
			- containerPort: 5432
			env:
			- name: POSTGRES_DB
			value: "kubenews"
			- name: POSTGRES_USER
			value: "kubenews"
			- name: POSTGRES_PASSWORD
			value: "Pg#123"       
	---
	apiVersion: v1
	kind: Service
	metadata:
	name: postgre
	spec:
	selector:
		app: postgre
	ports:
		- port: 5432
	type: ClusterIP

```bash
kubectl apply -f .\deployment.yaml
kubectl get pods
kubectl get all
kubectl port-forward service/postgre 5432:5432
```
### deployment.yaml
	apiVersion: apps/v1
	kind: Deployment
	metadata:
	name: postgre
	spec:
	selector:
		matchLabels:
		app: postgre
	template:
		metadata:
		labels:
			app: postgre
		spec:
		containers:
		- name: postgre
			image: postgres:15.0
			ports:
			- containerPort: 5432
			env:
			- name: POSTGRES_DB
			value: "kubenews"
			- name: POSTGRES_USER
			value: "kubenews"
			- name: POSTGRES_PASSWORD
			value: "Pg#123"       
	---
	apiVersion: v1
	kind: Service
	metadata:
	name: postgre
	spec:
	selector:
		app: postgre
	ports:
		- port: 5432
	type: ClusterIP
	---
	apiVersion: apps/v1
	kind: Deployment
	metadata:
	name: web
	spec:
	selector:
		matchLabels:
		app: web
	template:
		metadata:
		labels:
			app: web
		spec:
		containers:
		- name: web
			image: fagnerfgb/kube-news:v1
			ports:
			- containerPort: 8080
			env:
			- name: DB_DATABASE
			value: "kubenews"
			- name: DB_USERNAME
			value: "kubenews"
			- name: DB_PASSWORD
			value: "Pg#123"
			- name: DB_HOST
			value: "postgre"
	---
	apiVersion: v1
	kind: Service
	metadata:
	name: web
	spec:
	selector:
		app: web
	ports:
		- port: 80
		targetPort: 8080
		nodePort: 30000
	type: NodePort

```bash
kubectl apply -f .\deployment.yaml
kubectl get pods
kubectl port-forward service/postgre 5432:5432
```
