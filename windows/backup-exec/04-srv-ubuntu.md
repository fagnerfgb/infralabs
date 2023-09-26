#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023  
#Data de atualização: 26/09/2023  
#Versão: 0.02  

# Ubuntu Server 22.04.02 LTS  

## Guia Geral  
	* Avançado  
		* Área de Transferência Compartilhada: Bi-direcional  
		* Arrastar e Soltar: Bi-direcional  
## Guia Sistema  
	* Placa-Mãe:   
		* Memória Base: 4096 MB
		* Habilitar o I/O APIC 
		* Relógio da máquina retorna hora UTC 
	* Processador:   
   		*  2 CPUs  
   		*  Habilitar PAE/NX  
## Guia Monitor  
	* Tela
		* Memória de vídeo: 128MB   
		* Desmarcar Habilitar Aceleração 3D  
## Guia Armazenamento  
	* Disco Rígido SATA 0 - Drive de estado sólido HD: 100GB - VDI (Sistema)  
## Guia Áudio  
	* Desmarcar opção Habilitar Áudio  
## Guia Rede  
	* Adaptador 2 - Host-only (192.168.56.10)    
## Instalação do Ubuntu Server  
	* Use UP, DOWN and ENTER keys to select your language  
	* English - <Enter>  
	* Keyboard configuration  
		* Layout: [Portuguese (Brazil)]  
		* Variant: [Portuguese (Brazil)]  
	* Network connections  
		* enp0s8 eth  
		* Edit IPv4  
			* IPv4 Method: Manual  
				* Subnet: 192.168.56.0/24  
				* Address: 192.168.56.10  
				* Gateway: 192.168.56.254 
				* Name servers: 192.168.56.11  
				* Search domains: grupo2.intra  
	* Configure proxy  
		* <Done>  
	* Configure Ubuntu archive mirror  
		* Mirror: http://us.archive.ubuntu.com/ubuntu  
		* Continue without update  
		* <Done>  
	* Guided storage configuration  
		* Use an entire disk  
		* [VBOX_HARDISK local disk 100.000G]  
		* Set up this disk as an LVM group  
		* Storage configuration  
		* USED DEVICES  
		* ubuntu-lv new, to be formatted as ext4, mounted at / 97.996G  
		* Edit  
			* Name: ubuntu-lv  
			* Size: 97.996G  
			* Format: ext4  
			* Mount: /  
			* Confirm destructive action  
	* <Continue>  
	* Profile setup  
		* Your name: senac  
		* Your server's name: srv-ubuntu  
		* Pick a username: senac  
		* Choose a password: 123@senac  
		* Confirm your passwords: 123@senac  
	* SSH Setup  
		* Install OpenSSH server: ON  
		* Import SSH identity: No  
	* Featured Server Snaps  
		* <Done>  
	* Install complete!  
		* <Reboot Now>  
		* Please remove the installation medium, then press ENTER  
## Atualização  
	sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean && sudo reboot  

## Configuração do Locale (Localidade)  
	sudo localectl  
	sudo locale-gen pt_BR.UTF-8  
	sudo localectl set-locale LANG=pt_BR.UTF-8  
	sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8 LANGUAGE="pt_BR:pt:en"  

## Configuração do Timezone (Fuso Horário) do Sistema Operacional Ubuntu Server  
	 sudo timedatectl  
	 sudo timedatectl set-timezone "America/Sao_Paulo"  
	 sudo cat /etc/timezone  
	 sudo cat /etc/systemd/timesyncd.conf  
	 sudo vim /etc/systemd/timesyncd.conf  
	 	[Time]  
	 	NTP=a.st1.ntp.br  
	 	FallbackNTP=a.ntp.br  
	 sudo systemctl restart systemd-timesyncd.service  
	 sudo systemctl status systemd-timesyncd.service  
	 sudo timedatectl  
	 sudo reboot  

## Instalação e configuração do Netplan  
	sudo apt install bridge-utils ifenslave net-tools -y  
	Configuração do endereçamento IPv4 Static (Estático)  
	sudo vim /etc/netplan/00-installer-config.yaml  
	network:  
	  ethernets:  
	        enp0s3:  
	            dhcp4: true  
	            nameservers:  
	                addresses: [192.168.56.11]  
	        enp0s8:  
	            addresses: ['192.168.56.10/24']  
	            nameservers:  
	                addresses:  
	                  - 192.168.56.11  
	                  - 8.8.8.8  
	                  - 8.8.4.4  
	                search:  
	                  - grupo2.intra  
	  version: 2  

## Aplicando as configurações e verificando o status da Placa de Rede  
	sudo netplan --debug try  
	sudo netplan --debug apply  

## Instalação do LAMP  
	sudo apt update && sudo apt upgrade -y  
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
	sudo apt install php libapache2-mod-php php-cli php-fpm php-json php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y  
	sudo a2enmod php8.1  
	php -v  
	sudo vim /var/www/html/phpinfo.php  
		<?php phpinfo(); ?>  
## Instalação do Webmin  
	sudo apt update  
	sudo apt install vim apt-transport-https curl wget software-properties-common -y  
	wget https://download.webmin.com/jcameron-key.asc  
	cat jcameron-key.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/jcameron-key.gpg >/dev/null  
	sudo add-apt-repository "deb https://download.webmin.com/download/repository sarge contrib"  
	sudo apt install webmin -y  
	sudo ufw allow 10000  
	sudo systemctl status webmin  

	Alterar porta do Webmin  
	Como o Backup Exec também utiliza a porta 10000, irei trocar a porta do webmin para 11000  

	sudo vim /etc/webmin/miniserv.conf  
		port=11000  
		listen 11000 

	sudo systemctl restart webmin  
	sudo ufw allow 11000/tcp 
## Criando registro no arquivos hosts
	sudo vim /etc/hosts  
	127.0.0.1 srv-ubuntu.grupo2.intra srv-ubuntu  
## Liberações no firewall para funcionamento correto do backup exec
	sudo ufw allow 10000/tcp 
	sudo ufw allow 60000:61000/tcp
## Instalação do Agente
```
Copiar o arquivo RALUS_RMALS-1193.1338.tar.gz do DVD do Backup Exec para o servidor ubuntu usando o webmin
Clique em Tools, File Manager e selecione o diretório /tmp
Clique em File, Upload to current directory
Selecione o arquivo RALUS_RMALS-1193.1338.tar.gz, marque a opção Extract Compressed e clique em Upload
Abra o terminal e digite cd /tmp/RALUS_RMALS-1193.1338
Agora digite sudo ./installralus
Enter
Enter
Enter
Enter
Enter
y
n
Enter
y
Enter
## Adicionar usuário senac ao grupo beoper usando o webmin
System, Users and Groups, Local Groups
Clique em beoper, adicione o usuário senac e clique em Save
```
# Não utilizei o roteiro abaixo
## Samba
	sudo apt-get update  
	sudo apt-get install krb5-user samba sssd sssd-tools libnss-sss libpam-sss ntp ntpdate realmd adcli -y  

	sudo vim /etc/ntp.conf  
	server grupo2.intra  

	sudo systemctl stop ntp  
	sudo ntpdate grupo2.intra  
	sudo systemctl start ntp  
## Adicionando servidor ao domínio
	sudo realm discover GRUPO2.INTRA  
	kinit -V thanos@GRUPO2.INTRA  
	sudo realm join --verbose GRUPO2.INTRA -U 'thanos@GRUPO2.INTRA' --install=/  
## Compartilhamento de pasta  
	sudo apt update  
	sudo apt install samba -y  
### Abrir o webmin  
	System, Users and Groups    
	Create a new user  
	Username: samba  
	Real name: samba  
	Normal password: 123@senac  
	Primary Group, Existing group: users  
	Create button  
### Servers, Samba Windows File Sharing, Samba users, Convert users  
	Selecione: Only listed users or UID ranges e insira o usuário samba  
	Selecione: Use this password: e insira a senha: 123@senac  
	Convert  
### Criar pasta  
	Tools, File Manager  
	Ir até /home/samba  
	File, Create new directory  
	bkp, create  
### Servers, Samba Windows File Sharing  
	Create a new file share  
	Share name: bkp  
	Directory to share: /home/samba/bkp  
	Create with owner: samba  
	Create with group: users  
	Create  
### Em Share Name, clique em bkp  
	Clique em Security and Access Control  
	Writable? Yes  
	Valid users: samba  
	Save  
	Save  

	sudo vim /etc/samba/smb.conf  
	Na seção [global] adicionar as linhas abaixo:  
		follow symlinks = yes  
		wide links = yes  
		unix extensions = no  
### Servers, Samba Windows File Sharing, Windows Networking  
	Workgroup: grupo2.intra  
	WINS mode: Be WINS server  
	Save  
### Servers, Samba Windows File Sharing, Windows Networking  
	Restart Samba Servers  
### Liberações no Firewall
	sudo ufw allow 445/tcp  
	sudo ufw allow 137/udp  
	sudo ufw allow 138/udp  
	sudo ufw allow 139/tcp  
	sudo ufw disable  
	sudo ufw enable  