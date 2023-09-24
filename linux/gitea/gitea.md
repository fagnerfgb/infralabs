#Autor: Fagner Geraldes Braga  
#Data de criação: 09/03/2023  
#Data de atualização: 09/03/2023  
#Versão: 0.01  

## Informações Gerais
	Sistema Operacional: Ubuntu Server 22.04.02 LTS (Jammy Jellyfish)
	Funções:  LAMP, Webmin, Gitea

## Instalação do Ubuntu Server
	Use UP, DOWN and ENTER keys to select your language
		English - <Enter>
	Keyboard configuration
		Layout: [Portuguese (Brazil)]
		Variant: [Portuguese (Brazil)]
	Network connections
		Enp160 eth 
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
		Mirror: http://us.archive.ubuntu.com/ubuntu
	Continue without update
		<Done>
	Guided storage configuration
		Use an entire disk
			[local disk 30.000G]
			Set up this disk as an LVM group
	Storage configuration
		USED DEVICES
		ubuntu-lv	new, to be formatted as ext4, mounted at /	27.996G 
		Edit
			Name: ubuntu-lv
			Size: 27.996G
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
	systemctl status apache2

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
### MariaDB
	sudo apt install mariadb-server mariadb-client -y
	sudo mysql_secure_installation
	enter
	n
	Y
	123@senac
	123@senac
	Y
	Y
	Y
	Y

	sudo ufw allow 3306
	sudo ufw disable
	sudo ufw enable

	sudo mysql -u root -p
	SET GLOBAL validate_password.policy=LOW;
	CREATE USER 'gitea'@'localhost' IDENTIFIED BY '123@senac';
	CREATE DATABASE gitea;
	GRANT ALL ON gitea.* TO 'gitea'@'localhost';
	FLUSH PRIVILEGES;
	EXIT;

## Criação de um usuário Git
	sudo adduser \
	--system \
	--shell /bin/bash \
	--gecos 'Git Version Control' \
	--group \
	--disabled-password \
	--home /home/git \
	git

## Download do binário Gitea
	sudo wget -O /usr/local/bin/gitea https://dl.gitea.com/gitea/1.18.3/gitea-1.18.3-linux-amd64

## Transformando o binário em executável
	sudo chmod +x /usr/local/bin/gitea

## Criando estrutura de diretórios e concedendo permissões e propriedades 
	sudo mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
	sudo chown git: /var/lib/gitea/{data,indexers,log}
	sudo chmod 750 /var/lib/gitea/{data,indexers,log}
	sudo mkdir /etc/gitea
	sudo chown root:git /etc/gitea
	sudo chmod 770 /etc/gitea

## Criando arquivo Systemd 
	sudo wget https://raw.githubusercontent.com/go-gitea/gitea/main/contrib/systemd/gitea.service -P /etc/systemd/system/ 

## Recarregando e habilitando o serviço Gitea
	sudo systemctl daemon-reload
	sudo systemctl enable --now gitea
	sudo systemctl status gitea

## Liberar porta 3000 no firewall
	sudo ufw allow 3000/tcp

## Configurando o Gitea
	No navegador 192.168.56.10:3000
	Banco de Dados: MySQL
	Servidor: 127.0.0.1:3306
	Nome de usuário: gitea
	Senha: 123@senac
	Nome do banco de dados: gitea
	Domínio do servidor: 192.168.56.10
	URL base do Gitea: http://192.168.56.10:3000/