#Autor: Fagner Geraldes Braga  
#Data de criação: 21/12/2023  
#Data de atualização: 21/12/2023  
#Versão: 0.01  

## Informações Gerais
	Sistema Operacional: Ubuntu Server 22.04.03 LTS (Jammy Jellyfish)
	Funções:  

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
				Subnet: 192.168.0.0/24
				Address: 192.168.0.6
				Gateway: 192.168.0.1
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

sudo vim /etc/php/8.1/apache2/php.ini
	memory_limit = 128MB
	post_max_size = 16MB
	upload_max_filesize = 2M
	max_execution_time = 300
	max_input_time = 300
	date.timezone = America/Sao_Paulo

sudo systemctl restart apache2

# Instalando o Serviço MySQL
sudo apt install -y mysql-server
sudo mysql_secure_installation
Y
1
Y
Y
Y
Y

# Criando a base
sudo mysql -uroot -p

create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'Password.1@';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit; 

# Tuning do MySQL

sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

[mysqld] 
thread_cache_size = 16 ### Valor por padrão : 9 
key_buffer_size = 8388608 ### Valor por padrão : 8388608 
max_allowed_packet = 1073741824 ### Valor por padrão : 67108864 
sort_buffer_size = 262144 ### Valor por padrão : 262144 
read_rnd_buffer_size = 262144 ### Valor por padrão : 262144 
bulk_insert_buffer_size = 8M ### Valor por padrão : 8388608 
myisam_sort_buffer_size = 8388608 ### Valor por padrão : 8388608 
innodb_buffer_pool_instances = 2 ### Valor por padrão : 1 
innodb_buffer_pool_size = 3221225472 ### Valor por padrão : 134217728 
max_heap_table_size = 256M ### Valor por padrão : 16777216 
tmp_table_size = 256M ### Valor por padrão : 16777216 
join_buffer_size = 8M ### Valor por padrão : 262144 
max_connections = 151 ### Valor por padrão : 151 
table_open_cache = 4096 ### Valor por padrão : 4000 
table_definition_cache = 2432 ### Valor por padrão : 2000 
innodb_flush_log_at_trx_commit = 2 ### Valor por padrão : 1 
innodb_log_file_size = 402653184 ### Valor por padrão : 50331648 
innodb_write_io_threads = 4 ### Valor por padrão : 4 
innodb_read_io_threads = 4 ### Valor por padrão : 4 
innodb_file_per_table = 1 ### Valor por padrão : ON 
innodb_flush_method = O_DIRECT ### Valor por padrão : fsync 
innodb_thread_concurrency = 0 ### Valor por padrão : 0 
innodb_buffer_pool_chunk_size = 134217728 ### Valor por padrão : 134217728

sudo systemctl restart mysql



# Instalando o Zabbix
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb

sudo dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb

sudo apt update

sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y

sudo zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix 

sudo mysql -uroot -p
set global log_bin_trust_function_creators = 0;
quit;

sudo vim /etc/zabbix/zabbix_server.conf 
	DBPassword=Password.1@

sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2 

http://192.168.0.6/zabbix

