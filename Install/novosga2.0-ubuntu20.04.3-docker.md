#Autor: Fagner Geraldes Braga    
#Data de criação: 20/11/2021    
#Data de atualização: 18/12/2021  
#Versão: 0.02
***
UBUNTU SERVER 20.04.3  
SERVIÇO: EMISSÃO DE SENHAS PARA CONTROLE DE FILAS  
NOME: NOVOSGA 2.0  
RAM: 1GB  
HD: 50GB - VDI  
***
Guia Geral  
Avançado  
Área de Transferência Compartilhada: Bi-direcional  
Arrastar e Soltar: Bi-direcional  
***
Guia Sistema  
Placa-Mãe: Desmarcar Relógio da máquina retorna hora UTC  
Processador:   
    2 CPUs  
    Habilitar PAE/NX  
***  
Guia Monitor  
Memória de Vídeo: 128MB  
***    
Guia Armazenamento  
Disco Rígido SATA 0 - Drive de estado sólido  
Drive Óptico - Apontar caminho da ISO do Linux Ubuntu 
***
Guia Áudio  
Desmarcar opção Habilitar Áudio  
***
Guia Rede  
Adaptador 1 - Habilitar Placa de Rede (Modo Bridge)  
***
Instalar Ubuntu  
English  
Layout do Teclado: Portuguese (Brazil)  
Done  
Na placa de rede selecione "Edit IPv4" para colocar IP fixo  
Manual  
Subnet: 192.168.0.0/24  
Address: 192.168.0.21  
Gateway: 192.168.0.1  
Save  
Done  
Done  
Done  
Use an entire disk  
Done  
Done  
Continue  
***
Your name: suporte  
Your server's name: novosga  
Pick a username: suporte  
Choose a password: suporte  
Confirm your password: suporte  
Done  
***	
Done  
Done  
Restart  
Enter  
***
```bash
# Preparar o repositório  
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adicionar chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Comando para preparar para instalar o ambiente estável do Docker  
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar o Docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

# Criando diretório e arquivo docker-compose.yml
sudo mkdir /var/novosga
sudo vim /var/novosga/docker-compose.yml

# Copie e cole os comandos abaixo dentro do arquivo docker-compose.yml

version: '2'

services:
  novosga:
    image: novosga/novosga:latest
    restart: always
    depends_on:
      - mysqldb
    ports:
      - "80:80"
      - "2020:2020"
    environment:
      APP_ENV: 'prod'
      # database connection
      DATABASE_URL: 'mysql://novosga:Dti1858!@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7'
      # default admin user
      NOVOSGA_ADMIN_USERNAME: 'admin'
      NOVOSGA_ADMIN_PASSWORD: 'Dti1859!'
      NOVOSGA_ADMIN_FIRSTNAME: 'Administrator'
      NOVOSGA_ADMIN_LASTNAME: 'Global'
      # default unity
      NOVOSGA_UNITY_NAME: 'Atendimento'
      NOVOSGA_UNITY_CODE: 'ATD'
      # default no-priority
      NOVOSGA_NOPRIORITY_NAME: 'Normal'
      NOVOSGA_NOPRIORITY_DESCRIPTION: 'Serviço Normal'
      # default priority
      NOVOSGA_PRIORITY_NAME: 'Prioridade'
      NOVOSGA_PRIORITY_DESCRIPTION: 'Serviço Prioritário'
      # default place
      NOVOSGA_PLACE_NAME: 'Atendimento'
      # Set TimeZone and locale
      TZ: 'America/Sao_Paulo'
      LANGUAGE: 'pt_BR'
  mysqldb:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_USER: 'novosga'
      MYSQL_DATABASE: 'novosga2'
      MYSQL_ROOT_PASSWORD: 'Dti1859!'
      MYSQL_PASSWORD: 'Dti1858!'
      # Set TimeZone
      TZ: 'America/Sao_Paulo'

      # Finalizando o processo de criação dos contêineres
      cd /var/novosga
      sudo docker-compose up -d
      sudo docker-compose up

