#Autor: Fagner Geraldes Braga  
#Data de criação: 10/11/2023  
#Data de atualização: 10/11/2023  
#Versão: 0.01

## Instalação do Docker no Ubuntu Server 22.04 LTS
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
```docker
sudo docker run hello-world
```
```bash
sudo usermod -aG docker $USER 
```
## Conectando ao repositório do GitHub
```bash
git config --global user.name "fagnerfgb"
git config --global user.email "fagner.fgb@gmail.com"
cd ~/.ssh
ssh-keygen -o -t rsa -C "fagner.fgb@gmail.com"
cat id_rsa.pub
```
```
git clone git@github.com:fagnerfgb/infralabs.git
```
## Conectando ao Docker
```docker
docker login -u fagnerfgb
```


