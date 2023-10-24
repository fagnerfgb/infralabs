		#Autor: Fagner Geraldes Braga  
#Data de criação: 27/09/2023  
#Data de atualização: 27/09/2023  
#Versão: 0.01  

## Informações Gerais
	Sistema Operacional: Ubuntu Server 22.04.03 LTS (Jammy Jellyfish)
	Funções:  LAMP, Webmin, GLPI

## Instalação do Ubuntu Server
	Use UP, DOWN and ENTER keys to select your language
		English - <Enter>
	Keyboard configuration
		Layout: [Portuguese (Brazil)]
		Variant: [Portuguese (Brazil)]
	Network connections
		enp0s8 eth 
			Edit IPv4
			IPv4 Method: Manual
				Subnet: 192.168.56.0/24
				Address: 192.168.56.10
				Gateway: 
				Name servers: 8.8.8.8, 8.8.4.4	
				Search domains:
	Configure proxy
		<Done>
	Configure Ubuntu archive mirror
		Mirror: http://br.archive.ubuntu.com/ubuntu
	Continue without update
		<Done>
	Guided storage configuration
		Use an entire disk
			[local disk 100.000G]
			Set up this disk as an LVM group
	Storage configuration
		USED DEVICES
		ubuntu-lv	new, to be formatted as ext4, mounted at /	99.996G 
		Edit
			Name: ubuntu-lv
			Size: 97.996G
			Format: ext4
			Mount: /
	Confirm destructive action
		<Continue>
	Profile setup
		Your name: senac
		Your server's name: srv-ubuntu
		Pick a username: senac
		Choose a password: 123@senac
		Confirm your passwords: 123@senac
	SSH Setup
		Install OpenSSH server: ON
		Import SSH identity: No
	Featured Server Snaps
		<Done>
	Install complete!
		<Reboot Now>
	Please remove the installation medium, then press ENTER
 
## Atualização
	sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean && sudo reboot

## Configuração do Locale
	sudo localectl
	sudo locale-gen pt_BR.UTF-8
	sudo localectl set-locale LANG=pt_BR.UTF-8
	sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8 LANGUAGE="pt_BR:pt:en"

## Timezone set up
	sudo timedatectl
	sudo timedatectl set-timezone "America/Sao_Paulo"
	sudo cat /etc/timezone
	sudo vim /etc/systemd/timesyncd.conf
		[Time]
		NTP=a.st1.ntp.br
		FallbackNTP=a.ntp.br
	sudo systemctl restart systemd-timesyncd.service
	sudo systemctl status systemd-timesyncd.service
	sudo timedatectl
	sudo reboot

## Webmin install
	sudo apt update
	sudo apt install vim apt-transport-https curl wget software-properties-common -y
	wget https://download.webmin.com/jcameron-key.asc
	cat jcameron-key.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/jcameron-key.gpg >/dev/null
	sudo add-apt-repository "deb https://download.webmin.com/download/repository sarge contrib"
	sudo apt install webmin -y
	sudo ufw allow 10000
	sudo systemctl status webmin

## LAMP install
### Apache
	sudo apt install -y apache2 apache2-utils
	sudo apache2 -v
	sudo systemctl status apache2

	sudo systemctl reload apache2
	sudo systemctl enable apache2

	sudo systemctl is-enabled apache2

	sudo apt install elinks -y
	sudo apache2ctl fullstatus

	sudo ufw allow "Apache Full"
	sudo ufw allow 3306
	sudo ufw disable
	sudo ufw enable
### PHP
	sudo apt install php libapache2-mod-php php-cli php-fpm php-json php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath -y

	sudo a2enmod php8.1

	php -v

	sudo vim /var/www/html/phpinfo.php
		<?php phpinfo(); ?>


sudo apt install -y apache2 libapache2-mod-php php-soap php-cas php php-{apcu,cli,common,curl,gd,imap,ldap,mysql,xmlrpc,xml,mbstring,bcmath,intl,zip,redis,bz2}


# Criar arquivo com conteúdo
sudo vim /etc/apache2/conf-available/glpi.conf
<Directory "/var/www/glpi/public/">
    AllowOverride All
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ index.php [QSA,L]
    Options -Indexes
    Options -Includes -ExecCGI
    Require all granted
 
    <IfModule mod_php7.c>
        php_value max_execution_time 600
        php_value always_populate_raw_post_data -1
    </IfModule>
 
    <IfModule mod_php8.c>
        php_value max_execution_time 600
        php_value always_populate_raw_post_data -1
    </IfModule>
 
</Directory>

 
# Habilitar o módulo rewrite do apache
sudo a2enmod rewrite
 
# Habilita a configuração criada
sudo a2enconf glpi.conf
 
# Reinicia o servidor web considerando a nova configuração
sudo systemctl restart apache2

# Criar diretório onde o GLPi será instalado
sudo mkdir /var/www/glpi
 
# Baixar o sistema GLPi
wget -O- https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz| sudo tar -zxv -C /var/www/
 
# Movendo diretórios "files" e "config" para fora do GLPi 
sudo mv /var/www/glpi/files /var/www/
sudo mv /var/www/glpi/config /var/www/
 
# Ajustando código do GLPi para o novo local dos diretórios
sudo sed -i 's/\/config/\/..\/config/g' /var/www/glpi/inc/based_config.php
sudo sed -i 's/\/files/\/..\/files/g' /var/www/glpi/inc/based_config.php

# Ajustar propriedade de arquivos da aplicação GLPi
sudo chown senac:senac /var/www/glpi -Rf
 
# Ajustar propriedade de arquivos files, config e marketplace
sudo chown www-data:www-data /var/www/files -Rf
sudo chown www-data:www-data /var/www/config -Rf
sudo chown www-data:www-data /var/www/glpi/marketplace -Rf
 
# Ajustar permissões gerais
sudo find /var/www/ -type d -exec chmod 755 {} \;
sudo find /var/www/ -type f -exec chmod 644 {} \;

# Criando link simbólico para o sistema GLPi dentro do diretório defalt do apache
sudo ln -s /var/www/glpi /var/www/html/glpi

# Instalando o Serviço MySQL
sudo apt install -y mysql-server

# Criando base de dados
sudo mysql -e "create database glpi character set utf8"
 
# Criando usuário
sudo mysql -e "create user 'glpi'@'localhost' identified by '123@senac'"
 
# Dando privilégios ao usuário
sudo mysql -e "grant all privileges on glpi.* to 'glpi'@'localhost' with grant option";

# Habilitando suporte ao timezone no MySQL/Mariadb
sudo mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql mysql
 
# Permitindo acesso do usuário ao TimeZone
sudo mysql -e "GRANT SELECT ON mysql.time_zone_name TO 'glpi'@'localhost';"
 
# Forçando aplicação dos privilégios
sudo mysql -e "FLUSH PRIVILEGES;"

# Remover o arquivo de instalação do sistema
sudo rm /var/www/glpi/install/install.php  

# Criar entrada no agendador de tarefas do Linux
echo -e "* *\t* * *\troot\tphp /var/www/glpi/front/cron.php" >> sudo /etc/crontab
 
# Reiniciar agendador de tarefas para ler as novas configurações
sudo systemctl restart cron

# Instalando REDIS
sudo apt install -y redis
 
# Dizendo ao GLPi para usar o REDIS para cache
sudo php /var/www/glpi/bin/console cache:configure --context=core --dsn=redis://127.0.0.1:6379

# Inserção manual da resolução de nome no arquivo hosts
sudo vim /etc/hosts
192.168.56.10      glpi.local

# Criando o arquivo de configuração do site glpi.local
sudo vim /etc/apache2/sites-available/glpi.conf
<VirtualHost *:80>
 
        ServerName glpi.local
        ServerAdmin suporte@glpi.local'
        DocumentRoot /var/www/glpi/public
     
        ErrorLog \${APACHE_LOG_DIR}/glpi.error.log
        CustomLog \${APACHE_LOG_DIR}/glpi.access.log combined
 
</VirtualHost>

# Habilitando o site no Apache
sudo a2ensite glpi.conf
 
# Reiniciando o Apache para valer as novas configurações
sudo systemctl restart apache2


sudo vim /etc/apache2/sites-available/000-default.conf
```
<VirtualHost *:80>
    ServerName glpi.localhost

    DocumentRoot /var/www/glpi/public

    # If you want to place GLPI in a subfolder of your site (e.g. your virtual host is serving multiple applications),
    # you can use an Alias directive. If you do this, the DocumentRoot directive MUST NOT target the GLPI directory itself.
    # Alias "/glpi" "/var/www/glpi/public"

    <Directory /var/www/glpi/public>
        Require all granted

        RewriteEngine On

        # Redirect all requests to GLPI router, unless file exists.
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ index.php [QSA,L]
    </Directory>
</VirtualHost>
```
sudo vim /var/www/glpi/.htaccess
```
# /var/www/glpi/.htaccess
RewriteBase /
RewriteEngine On
RewriteCond %{REQUEST_URI} !^/public
RewriteRule ^(.*)$ public/index.php [QSA,L]
```
sudo a2enmod rewrite  
sudo systemctl restart apache2

sudo vim /etc/php/8.1/apache2/php.ini
```
session.cookie_httponly = on
```
## Configuração GLPI
```
Abrir o navegador e digitar o endereço http://192.168.56.10
Escolha e o idioma da instalação e clique em OK
Continuar
Instalar
Endereço do servidor SQL: localhost
Usuário SQL: glpi
Senha SQL: Password.1
Banco: glpi
Continuar
Continuar
Continuar
Usar GLPI

Usuário: glpi
Senha: glpi
```

sudo rm /var/www/html/glpi/install/install.php  
sudo mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql


