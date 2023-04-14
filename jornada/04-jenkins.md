#Autor: Fagner Geraldes Braga  
#Data de criação: 13/04/2023  
#Data de atualização: 13/04/2023  
#Versão: 0.01

# Jenkins

	CI/CD
	CI - Integração Contínua
	CD - Entrega Contínua

	Como você define uma pipeline CI/CD?
	Uma pipeline CI/CD permite conduzir o fluxo de entrega de novas versões de aplicações
	CI - Codificação, Commit, Build, Teste, Geração do pacote de entrega
	CD - Entregar uma release em algum ambiente
	Release, Teste, Aceite, Deploy

	OpenSource
	Lançado em 2005
	Java
	Extensível (Plugins)
	Interface de gerenciamento
	Trabalho com múltiplos SCMs
	Poder ser usado em qualquer ambiente cloud

Verificar a chave ssh que apaguei
```powershell
cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\terraform"
terraform init
terraform apply
yes

cp .\kube_config.yaml C:\Users\fagne\.kube\config

kubectl get nodes
```

## Instalação do Jenkins
### Recomendação da instalação em VM
	https://www.jenkins.io/

```bash
ssh -i C:\Users\fagne\terraform root@ip

apt update && apt install openjdk-17-jdk -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y
```
## Instalação do Docker
```bash
curl -fsSL https://get.docker.com | sh
usermod -aG docker jenkins
systemctl restart jenkins
systemctl status jenkins
```

## Instalação do Kubectl
```bash
# kubectl
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

### Navegador
	IP:8080
```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
# Copiar a chave
exit
```
	Instalar plugins sugeridos
	Nome de usuário:
	Senha:
	Confirmar a senha:
	Nome completo:
	Endereço de e-mail:
	Save and Continue
	Start using Jenkins
	Gerenciar Jenkins
	Gerenciar Extensões
	Disponíveis
		Docker
		Docker Pipeline
		Kubernetes CLI
	Baixar agora e instalar após reinício

	Nova Tarefa
	kube-news
	Pipeline

	Definition: Pipeline script from SCM
	SCM: Git
	Repository URL:
	Branch: /*main
	Script Path: Jenkinsfile

### No diretório kube-news
```bash
cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\kube-news"
# Criar arquivo Jenkinsfile
git add . && git commit -m " Criando arquivo Jenkinsfile" && git push
# Construir agora no Jenkins
git add . && git commit -m " Atualizando arquivo Jenkinsfile com credencial do docker" && git push
# Construir agora no Jenkins
git add . && git commit -m " Atualizando arquivo Jenkinsfile com credencial do kubeconfig" && git push
# Construir agora no Jenkins
```
### Criando Credencial Docker no Jenkins
	Painel, Gerenciar Jenkins, Manage Credentials
	System, Global Credentials
	+ Add Credentials
	Kind: Username with password
	Scope: Global
	Username:
	Password:
	ID: dockerhub
	Create

### Criando Credencial Kubeconfig no Jenkins
	Painel, Gerenciamento do Jenkins, Manage Credentials
	System, Global Credentials
	+ Add Credentials
	Kind: Secret file
	Scope: Global
	File: kube_config.yaml
	ID: kubeconfig
	Create

```bash
kubectl get pods
kubectl describe pods

git add . && git commit -m " Atualizando os arquivos deployment.yaml e Jenkinsfile com nova variável para sempre pegar a última versão da imagem" && git push
# Construir agora no Jenkins
kubectl get pods
kubectl describe pods
kubectl get  service
# Pegar ip e testar aplicação
```

### No Jenkins
	Configurar,  GitHub jook trigger for GITScm polling
	Pegar url do Jenkins
	Ir para o projeto kube-news no GitHub
	Settings
	Webhooks
	Add Webhooks
	Payload URL: Colar url do Jenkins/github-webhook/
	Add Webhook





