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
# Instalar Apache2  
sudo apt install apache2  
sudo a2enmod rewrite env  
sudo chmod -R 777 /etc/apache2/  
sudo systemctl restart apache2  

# Instalar PHP 7.4  
sudo apt-add-repository ppa:ondrej/php  
sudo apt update
sudo apt upgrade
sudo apt install php7.4 php7.4-mysql php7.4-curl php7.4-zip php7.4-intl php7.4-xml php7.4-mbstring
sudo chmod -R 777 /etc/php/

# Instalar MySQL 5.7
sudo apt install mariadb-server
sudo systemctl start mariadb
sudo mysql_secure_installation
enter
Y
suporte
suporte
Y
Y
Y
Y

# Criar banco de dados
sudo mysql -u root -p
suporte
CREATE DATABASE novosga_db;
CREATE USER 'novosga_us'@'%' IDENTIFIED BY 'suporte';
GRANT ALL PRIVILEGES ON novosga_db.* TO 'novosga_us'@'%' IDENTIFIED BY 'suporte';
FLUSH PRIVILEGES;
exit;

# Baixar o Composer
sudo wget https://getcomposer.org/download/1.6.0/composer.phar
sudo chmod +X composer.phar
export LANGUAGE=pt_BR
php composer.phar create-project "novosga/novosga:^2.0" ~/novosga
php composer.phar update -d ~/novosga
sudo mv novosga /var/www/html/
sudo chmod -R 777 /var/www/html/novosga/

# Preparar o cache da aplicação para o ambiente de produção
cd /var/www/html/novosga
sudo bin/console cache:clear --no-debug --no-warmup --env=prod
sudo bin/console cache:warmup --env=prod

# Alterar diretório raiz e habilitar
sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf
sudo vi /etc/apache2/sites-available/000-default.conf
# Insira o seguinte no final do arquivo:
<Directory /var/www/html>
AllowOverride All
</Directory>

# Criar e editar o arquivo .htaccess
sudo echo 'Options -MultiViews
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ index.php [QSA,L]
SetEnv APP_ENV prod
SetEnv LANGUAGE pt_BR
SetEnv DATABASE_URL mysql://novosga_us:suporte@localhost:3306/novosga_db
' > /var/www/html/novosga/public/.htaccess

# Configurar o timezone
sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.4/apache2/conf.d/datetimezone.ini
sudo systemctl restart apache2

# Comando install do Novo SGA
sudo APP_ENV=prod \
LANGUAGE=pt_BR \
DATABASE_URL="mysql://novosga_us:suporte@localhost:3306/novosga_db" \
bin/console novosga:install
admin
suporte
Administrator
Global
Enter
Enter
Enter
Enter
Enter
Enter
Enter
sudo chmod -R 777 /var/www/html/novosga/
```
Depois de instalado, vá no navegador e digite:  
http://192.168.0.21/novosga/public
