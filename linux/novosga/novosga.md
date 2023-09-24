#Autor: Fagner Geraldes Braga  
#Data de criação: 10/03/2023  
#Data de atualização: 10/03/2023  
#Versão: 0.01  

# Sistema de Controle de Filas - NovoSGA

## Sistema Operacional
	Ubuntu Server 22.04.02 LTS (Jammy Jellyfish)
	Apache, MariaDB, PHP, Webmin, novoSGA

## Desafio
	Instalar e homologar instalação do painel novoSGA no Ubuntu Server 22.04.02 LTS

## Problemas encontrados e solucionados

### Composer (Fase de homologação e testes)
	Quando montei o ambiente de testes no virtual box na minha residência, não consegui baixar o projeto usando o composer.
	Decidi utilizar a versão 20.04 e 22.04 do Ubuntu Server o comportamento foi o mesmo.
	Decidi então para o firewall das máquinas virtuais implementadas e o problema persistiu.
	Após isso parei também o firewall da minha estação de trabalho Windows e o problema continuou.
	Como último teste, parei também o antivírus da minha estação de trabalho e o problema continuou.
	No dia seguinte, levei a vm para retomar os testes na empresa e sem realizar nenhuma ação consegui atualizar o projeto usando o composer.
	Após todos estes testes, cheguei a conclusão de existir algum tipo de bloqueio da minha operadora de internet.
### Demora para a senha chamada aparecer no Painel
	Após finalizar a instalação e as configurações necessárias, comecei a testar a aplicação e notei que quando o atendente chamava uma senha de atendimento, esta senha demorava entre 10 e 15 segundos para aparecer no painel.
	Voltei as pesquisas e implantei um aplicativo chamado supervisor que faria o controle do websocket da aplicação, mas o problema da demora ainda continuava.
	Quando liberei a porta 2020 no firewall do servidor, o problema da demora foi resolvido, mas outro problema foi gerado, a página dos atendentes não mostrava mais as senhas conforme os clientes imprimiam os cupons. Era necessário dar um refresh no navegador para que as novas senhas fossem exibidas aos atendentes.
### Tela com a fila dos atendentes não atualiza	
	Para corrigir o problema adicionei uma linha de código que atualizava a tela de atendimento a cada 10000 ms e o problema foi resolvido.
	
### Composer (Implantação)
	No momento de colocar o sistema em produção, tive novamente problemas com o composer.
	Como eu já tinha o projeto pronto na máquina virtual, eu fiz a cópia e coloquei na produção.
	
### O sistema está funcionando e até o momento não houve nenhum problema.  
### As soluções do problemas mencionados estão explicada ao longo da documentação.  


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
	sudo a2enmod rewrite env
	sudo service apache2 restart
	sudo chmod -R 777 /etc/apache2/
	sudo systemctl restart apache2

	sudo apache2 -v
	sudo systemctl status apache2

	sudo systemctl reload apache2
	sudo systemctl enable apache2

	sudo systemctl is-enabled apache2

	sudo apt install elinks -y
	sudo apache2ctl fullstatus

	sudo ufw allow "Apache Full"
	sudo ufw disable
	sudo ufw enable
### PHP
	sudo apt-add-repository ppa:ondrej/php
	sudo apt update
	sudo apt install php7.4 php7.4-mysql php7.4-curl php7.4-zip php7.4-intl php7.4-xml php7.4-mbstring -y
	sudo chmod -R 777 /etc/php/

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
	123@senac	
	CREATE DATABASE novosga_db;	
	CREATE USER 'novosga_us'@'%' IDENTIFIED BY '123456';	
	GRANT ALL PRIVILEGES ON novosga_db.* TO 'novosga_us'@'%' IDENTIFIED BY '123456';	
	FLUSH PRIVILEGES;	
	exit;	
 
## NovoSGA
	export LANGUAGE=pt_BR
	Fazer upload do arquivo novosga.tar.gz para /var/www/html usando o webmin

	https://192.168.56.10:10000
	usuário: senac
	senha: 123@senac

	Tools, File Manager
	Ir até o diretório /var/www/html
	Clicar em File e depois em Upload to current directory
	Fazer upload do arquivo novosga.tar.gz, marcar a opção Extract compressed e depois clicar em Upload
	Depois de adicionar, ele acaba criando uma subpasta chamada painel dentro da pasta painel. Mover esta subpasta para /var/www/html de modo a eliminar a 	subpasta

	sudo chmod -R 777 /var/www/html/novosga/
	sudo chown -R senac:senac /var/www/html/novosga/

	cd /var/www/html/novosga
	sudo bin/console cache:clear --no-debug --no-warmup --env=prod
	sudo bin/console cache:warmup --env=prod

	sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

	sudo vim /etc/apache2/sites-available/000-default.conf
	Insira o seguinte no final do arquivo:

	<Directory /var/www/html>
	AllowOverride All
	</Directory>

	echo 'Options -MultiViews
	RewriteEngine On
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteRule ^(.*)$ index.php [QSA,L]
	SetEnv APP_ENV prod
	SetEnv LANGUAGE pt_BR
	SetEnv DATABASE_URL mysql://novosga_us:123456@localhost:3306/novosga_db
	' > /var/www/html/novosga/public/.htaccess

	sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.4/apache2/conf.d/datetimezone.ini

	sudo service apache2 restart

	APP_ENV=prod \
	LANGUAGE=pt_BR \
	DATABASE_URL="mysql://novosga_us:123456@localhost:3306/novosga_db" \
	bin/console novosga:install

	admin
	123@senac
	Administrator
	Global
	ATD
	Atendimento
	Normal
	Sem prioridade
	Prioridade
	Atendimento prioritário
	Guichê

	sudo chmod -R 777 /var/www/html/novosga/

## Configurando a aplicação
	http://192.168.56.10/novosga/public
	Usuário: admin
	Senha: 123@senac

	Clicar na Engrenagem no canto superior direito da tela

	Departamentos
	Nome: Atendimento
	Descrição: Atendimento

	Serviços
	Peso	Nome
	1	Atendimento

	Perfis
	Nome: Atendimento
	Descrição: Atendimento
	Permissões: Atendimento

	Nome: Administrador
	Descrição: Administrador
	Permissões: Atendimento, Configurações, Monitor, Relatórios, Triagem, Usuários

	Prioridades
	Peso	Nome
	0	Convencional
	1	Idoso
	2	Gestante
	3	Necessidades Especiais

	Locais
	Guichê
	Mesa
	Sala


	Web API
	Descrição: painel
	Public Id: 	***
	Client secret: 	***

	Descrição: triagem-touch
	Public Id: ***
	Client secret: ***

	Em ATD, Usuários
	Usuário	Senha	Unidade	Perfil
	guiche01	123@senac	ATD	Atendimento
	guiche02	123@senac	ATD	Atendimento
	guiche03	123@senac	ATD	Atendimento
	guiche04	123@senac	ATD	Atendimento
	guiche05	123@senac	ATD	Atendimento
	guiche06	123@senac	ATD	Atendimento
	guiche07	123@senac	ATD	Atendimento
	Admin		123@senac		

	Em ATD, Configurações
	Serviços
	Sigla	Serviço	Local	Departamento
	A	Atendimento	Guichê	Atendimento

	Permitir prioridade
	Contador: 
	Número inicial :1
	Número final: 999
	Incremento: 1

	Triagem
	Cabeçalho: SENAC
	Rodapé: SENAC

	Atendimento
	Guichês 1, 2, 3, 4, 5, 6, 7
	Tipo de atendimento: Todos

	Serviço	Peso
	A - Atendimento	1

	Adicionar Painel

	https://192.168.56.10:10000
	usuário: senac
	senha: 123@senac

	Tools, File Manager
	Ir até o diretório /var/www/html
	Clicar em File e depois em Upload to current directory
	Fazer upload do arquivo painel.tar.gz, marcar a opção Extract compressed e depois clicar em Upload
	Depois de adicionar, ele acaba criando uma subpasta chamada painel dentro da pasta painel. Mover esta subpasta para /var/www/html de modo a eliminar a 	subpasta

	Alterar a propriedade da pasta
	Selecione a pasta painel, clique em Tools e depois em Change ownership
	Tanto em user name como em Group name digite senac
	Marque a opção recursive e depois clique em Change

	No computador onde ficará o painel abra o navegador e digite
	http://192.168.56.10/painel

	Locale: Português (Brasil) Save

	Servidor: http://192.168.56.10/novosga/public
	Usuário: admin
	Senha: 123@senac
	Public Id: 	***
	Client secret: 	***
	Salvar

	Serviços
	Unidade ATD
	Serviços
	A - Convencional
	C - Gestante
	B - Idoso
	D - Necessidades Especiais
	Salvar

	Som
	Airport Bingbong
	Salvar

	No computador onde ficará a impressora e o monitor touch
	Copiar a pasta triagem-touch para a raiz da unidade C:\
	Abrir o executável Triagem Touch

	Interface
	Locale: Português Brasil
	Columns: 1
	Printer: EPSON TM-T20
	Wait time: 10s
	Save

	Servidor
	Servidor: http://192.168.56.10/novosga/public
	Usuário: admin
	Senha: 123@senac
	Public Id: ***
	Client secret: ***
	Salvar

	Serviços
	Unidade ATD
	Serviços
	A - Atendimento
	Salvar

	Configuração de Impressora Térmica

	Abrir Epson APD5 Utility for TM-T20
	User Defined Paper
	Paper Name: triagem-touch
	Unit: mm
	Width: 70.0
	Heigth 200.0
	Register

	Abrir Print Management
	Print Servers, ATD-PAINEL0X, Printers
	EPSON-TM-T20, Preferences, Advanced
	Paper Size: triagem-touch


	Supervisor (Controlar o Websocket)

	sudo apt install supervisor -y

	sudo vim /etc/supervisor/conf.d/novosga-websocket.conf
	[program:novosga-websocket]
	command=/var/www/html/novosga/bin/console novosga:websocket start
	autostart=true
	autorestart=true
	stderr_logfile=/var/log/novosga-websocket.err.log
	stdout_logfile=/var/log/novosga-websocket.out.log

	sudo supervisorctl reread 
	sudo supervisorctl update
	
	sudo vim /etc/supervisor/supervisord.conf
	[inet_http_server]
	port=*:9001
	username=admin
	password=123@senac

	sudo service supervisor restart

	sudo ufw allow 9001
	sudo ufw allow 2020
	
	https://192.168.56.10:9001
	username=admin
	password=123@senac

	Após liberar a porta 2020 no firewall, o problema do websocket foi resolvido e as senhas eram chamadas de forma instantânea no painel, porém quando o 	cliente emitia uma senha para algum serviço, ela parou de atualizar na tela dos atendentes, sendo necessário atualizar o navegador pressionando a tecla F5

	Para resolver o problema editei o arquivo script.js localizado em /var/www/html/novosga/public/bundles/../../modules/novosga/attendance-bundle/Resources/	public/js

	Após app.init(atendimento); eu inseri a instrução abaixo na linha 383
	setInterval(app.update, 10000);

	O problema foi resolvido.
	Caso o problema persista, limpe o cache do navegador. 

## Fontes:

[NovoSGA][site-url]

[site-url]:http://novosga.org/

[Ezectech][ezectech]

[ezectech]:https://ezectech.com/tutorial/instalacaonovo-sga-2-0-passo-a-passo-no-windows-10/

[Forum NovoSGA][forum]

[forum]:https://discuss.novosga.org/d/179-demora-para-chamar-senha-painel-web-2-0/17

[GitHub NovoSGA][github]

[github]:https://github.com/novosga/novosga/issues/318