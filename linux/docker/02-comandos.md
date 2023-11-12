#Autor: Fagner Geraldes Braga  
#Data de criação: 10/11/2023  
#Data de atualização: 10/11/2023  
#Versão: 0.01

```
docker run ubuntu
docker ps
docker container ls
docker ps –a
docker container ls –a
docker run --help
```
```
docker run ubuntu sleep 1d
docker ps
docker stop 336ad3db0df6
docker start 336ad3db0df6
docker exec -it 336ad3db0df6 bash
docker stop 336ad3db0df6
docker start 336ad3db0df6
docker pause 336ad3db0df6
docker unpause 336ad3db0df6
docker stop -t=0 336ad3db0df6
docker rm 336ad3db0df6
docker run -it ubuntu bash
docker stop 2aeb90a3d0d5
docker rm 2aeb90a3d0d5
```
```
docker run -d dockersamples/static-site
docker rm 01dda8fd5535 --force

docker run -d -P dockersamples/static-site
docker port 0b2ad5e4257c
docker rm 0b2ad5e4257c --force

docker run -d -p 8080:80 dockersamples/static-site
docker port b722a3238a94 
```
```
docker images
docker inspect f589ccde7957
docker history f589ccde7957
```
```
docker build -t fagnerbraga/app-exemplo:1.0 .
docker run -d -p 8080:3000 fagnerbraga/app-exemplo:1.0 .
```
```
docker stop $(docker ps -q)
```
```
docker build -t fagnerbraga/app-exemplo:1.1 .
docker run -d fagnerbraga/app-exemplo:1.1 .
```
```
docker build -t fagnerbraga/app-exemplo:1.2 .
docker run -d fagnerbraga/app-exemplo:1.2 .
```
```
docker stop $(docker ps -q) -t 0
docker rmi $(docker images -a -q) --force

```





 