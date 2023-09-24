#Autor: Fagner Geraldes Braga  
#Data de criação: 12/04/2023  
#Data de atualização: 12/04/2023  
#Versão: 0.01

# Terraform

	Projeto criado pela Hashicorp
	Trabalha baseado em providers
	Utiliza arquivos .tf

## Tipos de bloco
	Resources
	Data Sources 
	Variables
	Outputs

## Criação de chave ssh
```powershell
ssh-keygen -t rsa -b 2048
C:\Users\fagne/terraform
cat terraform.pub
# copiar chave para inserir no site da DigitalOcean
```

## DigitalOcean
	https://www.digitalocean.com/
	Settings
	Security, SSH keys, Add SSH Key
	Chave ssh:
	name: terraform
	Add SSH Key

## Criação do cluster Kubernetes
	Manage, Kubernetes
	Create, Kubernetes
	Choose a datacenter region: NYC1
	Select a version: Escolher a recomendada
	Node pool name: default
	Machine type (Droplet): Basic nodes
	Node plan: $24/month per node
	Nodes: 2

	Finalize
	Name: k8s-jornada
	Create Cluster

## Criação dos Droplets
	Manage, Droplets
	Create, Droplet
	Choose Region: New York
	Datacenter: New York Datacenter 1 NYC1
	OS: Ubuntu
	Version: 22.04 (LTS) x64
	Droplet Type: Basic
	CPU options: Regular
	2GB/1CPU
	50GB SSD Disk
	2TB transfer
	Choose Authentication Method
	SSH Key: terraform
	Finalize Details
	Quantity: 1 Droplet
	Hostname: jenkins
	Create Droplet

## Conectando na máquina Jenkins via SSH 
	```powershell
	ssh -i terraform root@ip
	```
### Conectando ao cluster Kubernetes
	Manage, Kubernetes
	k8s-jornada
	Download Config File
	Abrir arquivo e copiar conteúdo
	Salvar este conteúdo no arquivo C:\Users\fagne\.kube\config

```powershell
kubectl get nodes
```
### Copia do manifesto criado na aula 2
	cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\kube-news\k8s"

```powershell
kubectl apply -f .\deployment.yaml
kubectl get pods
kubectl get services
kubectl get all
# Pegar External-IP gerado pelo LoadBalancer para testar a aplicação
```

### Destruindo cluster Kubernetes e droplets
	first-project
	Clusters: k8s-jornada ... Destroy
	Actions
	Load Balancers
	Destroy All
	Cluster name: k8s-jornada
	Destroy

	first-project
	Droplets: jenkins ... Destroy
	Destroy this droplet
	jenkins
	Destroy

## Terraform - Windows
	https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_windows_amd64.zip
	
```powershell
cd \
mkdir tools
cd tools
cp E:\Users\fagne\Downloads\terraform_1.45_windows_amd64\terraform.exe .
```

	Adicionar variável de ambiente
	C:\tools

## Terraform - Linux
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
## Utilização do Terraform
```powershell
cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\"
mkdir terraform
cd terraform
# criar arquivo main.tf
```

	https://registry.terraform.io/

	https://www.digitalocean.com/
	API
	Tokens, Generate New Token
	Token name: jornada
	Expiration: 30 days
	Generate Token

```powershell
terraform init
terraform apply
yes

terraform
yes
ssh -i C:\Users\fagne\terraform root@ip

terraform fmt
terraform plan
terraform apply

cp .\kube_config.yaml C:\Users\fagne\.kube\config

kubectl get nodes
terraform destroy
```