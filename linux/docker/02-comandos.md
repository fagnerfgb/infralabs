#Autor: Fagner Geraldes Braga  
#Data de criação: 10/11/2023  
#Data de atualização: 10/11/2023  
#Versão: 0.01

```docker
docker run ubuntu
# baixa (caso ainda não tiver localmente) e executa a imagem
```
```docker
docker ps
docker container ls
# Lista os containers 

docker ps –a
docker container ls –a
# Lista todos os containers 
```
```docker
docker run ubuntu sleep 1d
# executa o container por um dia de forma a ter um processo ativo

docker ps

docker stop 336ad3db0df6
# para o container

docker start 336ad3db0df6
# inicia o container

docker exec -it 336ad3db0df6 bash
# executa o container de modo interativo e abre o terminal bash

docker stop 336ad3db0df6

docker start 336ad3db0df6

docker pause 336ad3db0df6
# pausa o container

docker unpause 336ad3db0df6
# despausa o container

docker stop -t=0 336ad3db0df6
# para o container de forma forçada

docker rm 336ad3db0df6
# exclui o container

docker run -it ubuntu bash
docker stop 2aeb90a3d0d5
docker rm 2aeb90a3d0d5
```

```docker
docker run -d dockersamples/static-site
# -d executa container em background

docker rm 01dda8fd5535 --force
# exclui o container de forma forçada

docker run -d -P dockersamples/static-site
docker port 0b2ad5e4257c
docker rm 0b2ad5e4257c --force

docker run -d -p 8080:80 dockersamples/static-site
# -p mapeia porta 8080 --> host 80 --> container

docker port b722a3238a94 
# lista as portas de determinado container
```
```docker
docker images
# mostra as imagens locais

docker inspect f589ccde7957
# mostra detalhes da imagem

docker history f589ccde7957
# mostra as camadas da imagem
```
```docker
docker build -t fagnerbraga/app-exemplo:1.0 .
# constroi a imagem a partir do Dockerfile

docker run -d -p 8080:3000 fagnerbraga/app-exemplo:1.0 .
# executa a imagem
```
```docker
docker stop $(docker ps -q)
# para todos os containers
```
```
docker build -t fagnerbraga/app-exemplo:1.1 .
docker run -d fagnerbraga/app-exemplo:1.1 .
```
```docker
docker build -t fagnerbraga/app-exemplo:1.2 .
docker run -d fagnerbraga/app-exemplo:1.2 .
docker run -p 9090:6000 -d fagnerbraga/app-exemplo:1.2 .
```

```docker
docker push fagnerbraga/app-exemplo:1.0

docker tag fagnerbraga/app-exemplo:1.0 fagnerfgb/app-exemplo:1.0
# cria tag para uma imagem existente

docker push fagnerfgb/app-exemplo:1.0
# envia imagem para o docker hub
```
```docker
docker tag fagnerbraga/app-exemplo:1.1 fagnerfgb/app-exemplo:1.1
docker push fagnerfgb/app-exemplo:1.1
```
```docker
docker tag fagnerbraga/app-exemplo:1.2 fagnerfgb/app-exemplo:1.2
docker push fagnerfgb/app-exemplo:1.2
```
```docker
docker container rm $(docker ps -aq) --force
# remove todos os containers

docker rmi $(docker image ls -aq) --force
# remove todas as imagens
```
```docker
docker run -it ubuntu bash

docker ps -s
# informa o tamanho do container
```
## Bind Mounts
```bash
mkdir ~/volume-docker
cd ~/volume-docker
```
```docker
docker run -itv  ~/volume-docker:/app ubuntu bash
# -v definir bind mount pasta-host:pasta-container

docker run -it --mount type=bind,source=/home/senac/volume-docker,target=/app ubuntu bash
# recomendado usar --mount ao invés de -v
```
## Volumes
```docker
docker volume ls
# lista os volumes disponíveis

docker volume create meu-volume
# cria volume

docker run -itv  meu-volume:/app ubuntu bash

sudo su -
cd /var/lib/docker/volumes/meu-volume/_data
exit

docker run -it --mount source=meu-volume,target=/app ubuntu bash
```
## TMPFS
```docker
# Só funciona no Linux
docker run -it --tmpfs=/app ubuntu bash

docker run -it --mount type=tmpfs,destination=/app ubuntu bash
```
## Rede Bridge
```docker
# Executar os comandos abaixo em dois terminais diferentes para poder realizar os testes de ping
docker run -it ubuntu bash
apt update
apt install iputils-ping -y
``` 
```docker
docker ps
docker inspect 02d7022bc509
docker network ls
```
```docker
docker network create --driver bridge minha-bridge
# cria uma rede

docker run -it --name ubuntu1 --network minha-bridge ubuntu bash
# --name cria um nome para o container
# --network adiciona a rede criada no passo anterior

apt update
apt install iputils-ping -y
```
```docker
# Executar os comandos abaixo em outro terminal para poder realizar os testes de ping
docker run --name pong --network minha-bridge -d ubuntu  sleep 1d
```
```docker
# Retornar ao terminal anterior
ping pong
```
## Rede None
```docker
docker run --name pong --network none -d ubuntu  sleep 1d
```
## Rede Host
```docker
docker run -d  --network host fagnerfgb/app-exemplo:1.0
docker inspect 195c89f9e3666068ff60e945e340b059a7685068abba88efbdb6ffb73e844af0

lynx localhost:3000
# abre navegador em modo text, já que estou usando ubuntu-server
```

```docker
docker pull mongo:4.4.6
docker pull aluradocker/alura-books:1.0
# baixa as imagens do docker hub

docker run -d --network minha-bridge --name meu-mongo mongo:4.4.6

docker run -d --network minha-bridge --name alurabooks -p 3000:3000 aluradocker/alura-books:1.0

# No navegador abrir a url ipdohost:3000
# Depois ipdohost:3000/seed
# Depois ipdohost:3000
# Será exibido os livros disponíveis
```
## Docker Compose
```bash
sudo apt-get update
sudo apt-get install docker-compose-plugin
sudo apt  install docker-compose -y
```
```docker
docker compose version
docker compose
cd ~/infralabs/linux/docker/ymls
docker-compose up
docker-compose up -d
docker-compose ps
docker-compose down
```