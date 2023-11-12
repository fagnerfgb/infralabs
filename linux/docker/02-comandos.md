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







```
docker stop $(docker ps -q) -t 0
docker rmi $(docker images -a -q) --force
```





 