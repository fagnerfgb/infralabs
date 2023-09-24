#Autor: Fagner Geraldes Braga  
#Data de criação: 10/04/2023  
#Data de atualização: 11/04/2023  
#Versão: 0.02

# Devops

## CALMS
Cultura, Automação, Lean, Monitoramento, Compartilhamento

## Containers  
	Elementos fundamentais:  
	Imagem e Container  

## Elementos da arquitetura do Docker
	Docker Client, Docker Daemon e Docker Registry

## Instalação
### Docker Linux
	curl -fsSL https://get.docker.com | sh
	sudo usermod -aG docker $USER
	docker container ls

### Docker Windows
#### Instalação do WSL
	Abrir o PowerShell como Administrador
	wsl --install
#### Download Docker
	https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module

## Comandos 1
```bash
	# executa o container hello-world
	# se não houver imagem no docker client ele baixa do docker registry
	docker container run hello-world
	
	# lista os contêineres em execução do docker client
	docker container ls

	# lista todos os contêineres 
	docker container ls -a

	# --name dá nome ao contêiner
	docker container run --name meucontainer hello-world

	# remove contêiner pelo nome ou pelo id
	docker container run --rm hello-world 
	docker container rm fe25b1cc61a8
	docker container rm adoring_pike
	
	# abre o contêiner ubuntu com o terminal bash
	docker container run -it ubuntu /bin/bash
	
	# para a execução do contêiner
	docker container stop sweet_wescoff
	
	# -d libera a sessão do terminal, jogando o contêiner para segundo plano
	docker container run -d nginx
	
	#Executa o shell dentro do docker
	docker container exec -it 15a732d061e0 /bin/bash
	
	curl http://localhost
	
	# -p 8080:80 bind de portas 8080 é o hospedeiro e 80 é do contêiner docker
	docker container run -p 8080:80 -d nginx

	# rm -f remoção forçada
	docker container rm -f 4946fc4c16f6

	# executa contêiner postgres criando usuário, senha e nome do banco
	docker container run -d -p 5432:5432 -e POSTGRES_PASSWORD=Pg@123 -e POSTGRES_USER=kubenews -e POSTGRES_DB=kubenews postgres
	docker container rm -f 47a0b00c0807
	docker container run -it ubuntu /bin/bash
```
## Dockerfile
```bash
# pega imagem ubuntu
FROM ubuntu
# atualiza a base do repositório
RUN apt update 
# instala o curl
RUN apt install curl --yes
```
```bash
# Executa o Dockerfile, cria a imagem ubuntu-curl e salva no diretório corrente
docker build -t ubuntu-curl .
# Lista as imagens existentes no docker client
docker image ls
# Executar o contêiner e abre o shell
docker container run -it ubuntu-curl /bin/bash
```

## Dockerfile
```bash
FROM ubuntu
RUN apt update && apt install git --yes && apt install curl --yes apt install vim --yes
```

## Comandos 2
```bash
	# Remove imagens não usados (Órfãos)
	docker image prune
	docker image rm -f 4fe7e164d58e
	docker image rm hello-world
	docker image rm 080ed0ed8312
```

## Subindo imagem para Docker Registry (Docker Cloud)
```bash
# cria imagem, coloca a versão e salva no diretório corrente
docker build -t fagnerfgb/ubuntu-curl:v1 .
# Conectar na Docker Cloud
docker login
# Mandar imagem para Docker Cloud
docker push fagnerfgb/ubuntu-curl:v1
# Criar tag como referência a última edição (Boa prática) 
docker tag fagnerfgb/ubuntu-curl:v1 fagnerfgb/ubuntu-curl:latest
# Subir a imagem com a nova referência de edição
docker push fagnerfgb/ubuntu-curl:latest
```

## Desafio
```bash
# Clonar repositório do Github
git clone https://github.com/fagnerfgb/conversao-temperatura.git

# Dentro do repositório do projeto clonado, criar o arquivo Dockerfile dentro de conversao-temperatura/src
# Usa a versão do node 18.11.0
FROM  node:18.11.0
# Define o diretório de trabalho do contêiner
WORKDIR /app
# Copia os arquivos que começam com package e terminam com .json no diretório app 
COPY package*.json ./
# Instala o npm
RUN npm install
# Copia todos os arquivos do diretório src do repositório que foi clonado do Github e sava no diretório app do conteiner 
COPY . .
# Expõe a porta 808
EXPOSE 8080
# Comando padrão que será utilizado quando contêiner iniciar sua execução
CMD ["node","server.js"]

docker build -t fagnerfgb/conversao-temperatura:v1 .
docker push fagnerfgb/conversao-temperatura:v1
docker tag fagnerfgb/conversao-temperatura:v1 fagnerfgb/conversao-temperatura:latest
docker push fagnerfgb/conversao-temperatura:latest
docker container run -d -p 8080:8080 fagnerfgb/conversao-temperatura:v1
```