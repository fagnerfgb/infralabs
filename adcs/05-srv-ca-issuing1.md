#Autor: Fagner Geraldes Braga  
#Data de criação: 01/04/2023  
#Data de atualização: 01/04/2023  
#Versão: 0.01  

# Windows Server 2002 Standard  

## Guia Geral  
	* Avançado  
		* Área de Transferência Compartilhada: Bi-direcional  
		* Arrastar e Soltar: Bi-direcional  
## Guia Sistema  
	* Placa-Mãe:   
		* Memória Base: 4096 MB
		* Habilitar o I/O APIC  
	* Processador:   
   		*  2 CPUs  
   		*  Habilitar PAE/NX  
   		*  Habilitar VT-x/AMD-V Aninhado  
## Guia Monitor  
	* Tela
		* Memória de vídeo: 256MB   
		* Desmarcar Habilitar Aceleração 3D  
## Guia Armazenamento  
	* Disco Rígido SATA 1 - Drive de estado sólido HD: 60GB - VDI (Sistema)  
## Guia Áudio  
	* Desmarcar opção Habilitar Áudio  
## Guia Rede  
	* Adaptador 1 - Rede Interna  
## Instalar Windows Server 2022 Standard (Experiência Desktop)  
	* Instalação Personalizada  
	* Um disco com partição de 60GB para SO  
## Adicionais para Convidado do VirtualBox  
	* Instalar CD dos Adicionais para Convidado do VirtualBox  
	* Reiniciar o computador  
## Windows Update  
	* Baixar e Instalar Atualizações disponíveis  
## UAC  
	* Nunca notificar  
## Propriedades do Sistema (Windows Pause + Break)  
	* Guia Avançado, Desempenho - Ajustar para obter um melhor desempenho  
	* Guia Remoto  
    	* Marcar Permitir conexões remotas com este computador  
## Gerenciador de Servidores  
    * Configuração de Segurança Aprimorada do IE  
        * Administradores - Desligada  
        * Usuários - Ligada  
## BGinfo  
	* Copiar pasta Scripts em C:\  
	* Colocar atalho do logon.vbs para executar na Inicialização do Sistema  
    	* C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp  
## Windows  
	* Usuário: Administrator  
	* Senha: 123@senac 
## Abrir o Powershell ISE como Administrador e executar os scripts na seguinte ordem:  
	* 00-config.ps1  
	* 01-domain.ps1
## Configurando ADCS
### CA ROOT STANDALONE
	Server Manager–> Manage –> Add Role and Features
	Role-based or feature-based installation
	Select a server from the server pool
	srv-ca-issuing1
	Active Directory Certificate Services
	Certification Authority
	Configure Active Directory Certificate Services on the destination server
	Credentials: GRUPO2\Thanos
	Certification Authority
	Enterprise CA
	Subordinate CA
	Create a new private key
	Cryptographic provider: RSA#Microsoft Software Key Storage Provider
	Key length: 2048
	Hash algorithm: SHA256
	Common name for this CA: SRV-CA-ISSUING1
	Distinguished name suffix: DC=grupo2,DC=intra
	Preview of distinguished name: CN=SRV-CA-ISSUING1,DC=grupo2,DC=intra
	Save a certificate request to file on the target machine
	File name: C:\srv-ca-issuing1.grupo2.intra_grupo2-SRV-CA-ISSUING1-CA.req 
	Validity period: 5 years
	Certificate database location: C:\Windows\system32\CertLog
	Certificate database log location: C:\Windows\system32\CertLog
### Inserindo Certificado assinado digitalmente pela CA ROOT e Inicializando o serviço da CA Emissora
	Após ter assinado digitalmente o certificado da CA Subordinada no servidor srv-ca-root01, copiá-lo para o servidor srv-ca-issuing1
	Server Manager, Tools, Certification Authority
	Clicar com o direito em SRV-CA-ISSUING1, All Tasks, Install CA Certificate
	Insira o caminho onde foi salvo o certificado
	Após importar, vai aparecer uma caixa de texto avisando que não foi possível verificar a lista de revogação.
	Clique em OK
	Abrir o prompt de comando como administrador e digitar o comando
	certutil -setreg ca\CRLFlags +CRLF_REVCHECK_IGNORE_OFFLINE
	Clicar com o direito em SRV-CA-ISSUING1, All Tasks, Start Service
### Duplicando um certificado de Web Server
	Server Manager, Tools, Certification Authority
	Clique em SRV-CA-ISSUING1
	Clique com o direito em Certificate Templates, Manage
	Clique com o direito em Web Server, Duplicate Template
	Na aba General 
	Dê um nome para o template: Fagner-Webserver
	Validity period: 1 Year
	Na aba Request Handling
	Marque a opção Allow private key to be exported e clique em OK
	Feche o Certificate Templates Console
### Emitindo o template
	Clique com o direito em Certificate Templates, New, Certificate Template to Issue
	Selecione o template gerado no passo anterior: Fagner-Webserver e clique em OK
### Concedendo permissão para uso do template
	Clique com o direito em Certificate Templates, Manage
	Clique com o direito em Fagner-Webserver, Properties, Security
	Add
	Clique em Object Types
	Marque a opção Computers e desmarque todas as outras e depois clique em OK
	Clique em Advanced, Find Now
	Escolha o computador o qual o certificado será gerado: SRV-CA-ISSUING1
	Nas permissões, além da opção de Read, marque também a permissão de Enroll
### Emitindo certificado para WebServer a partir do Template
	Pressione as teclas Winkey + R e digite MMC
	File Add/Remove Snap-in...
	Certificates Add>
	Computer account, Next
	Local computer, Finish, OK
	Clique em Certificates, Personal
	Clique com o direito em Certificates, All Tasks, Request New Certificate
	Next
	Next
	Marque a opção Fagner-WebServer e cliquem em More information is required to enroll for this certificate. Click here to configure settings.
	Clique na aba General
	Em Friendly name, insira o nome do seu site: www.fagnerbraga.com.br
	Clique na aba Subject
			
	Alternative name
	Type: URL Value: www.fagnerbraga.com.br
	Clique em OK, depois em Enroll e depois em Finish

	Vá para Certicates, Personal, Certificates e dê um duplo clique no certificado emitido: www.fagnerbraga.com.br
	Clique na aba Details, Copy to File...
	Next
	Yes, export the private key
	Next
	Personal Information Exchange - PKCS #12 (.PFX)
	Include all certificates in the certification path if possible
	Export all extended properties
	Next
	Marque a opção Password, insira e confirme a senha a ser utilizada: 123@senac
	Next
	Browse...
	Insira o local e o nome do arquivo: C:\Scripts\www.fagnerbraga.com.br.pfx e clique em Save
	Next
	Finish
	OK
	OK

### Habilitando o WebEnrollment
	Server Manager–> Manage –> Add Role and Features
	Role-based or feature-based installation
	Select a server from the server pool
	srv-ca-issuing1
	Active Directory Certificate Services
	Marcar a opção Certification Authority Web Enrollment
	Add Features
	Next
	Next
	Next
	Next
	Install
	Configure Active Directory Certificate Services on the destination server
	Credentials: GRUPO2\Thanos
	Next
	Marcar a opção Certification Authority Web Enrollment
	Next
	Configure
	Close
	Close

	Abra o navegador de internet e insira a URL abaixo para acessar a página do Web Enrollment
	http://localhost/certsrv/Default.asp

### Emitindo um certificado pelo IIS
	Criar um registro DNS no srv-dc01
	Server Manager, Tools, DNS
	SRV-DC01, Forward Lookup Zones 
	Clicar com o direito em grupo2.intra e selecionar New Host (A or AAAA)
	Name: ca
	IP address: 192.168.10.3
	Add Host
	OK
	Done

	Server Manager, Tools, Internet Information Services (IIS) Manager
	SRV-CA-ISSUING1
	Duplo clique em Server Certificates
	Create Certificate Request
	Common name: ca.grupo2.intra
	Organization: GRUPO2
	Organizational unit: Matriz
	City/locality: Sao Paulo
	State/province: SP
	Country/region: BR
	Next
	Cryptographic service provider: Microsoft RSA SChannel Cryptographic Provider
	Bit length: 1024
	Next
	Specify a file name for the certificate request: C:\Scripts\request-ca.grupo2.intra.txt
	Finish

	Abrir o arquivo request-ca.grupo2.intra.txt e copiar conteúdo dele
	Abrir o site http://localhost/certsrv/Default.asp
	Clicar em Request a certificate
	Submit an advanced certificate request
	Em Base-64-encoded certificate request (CMC or PKCS #10 or PKCS #7): colar o conteúdo do arquivo request-ca.grupo2.intra.txt
	Certificate Template: Web Server
	Attributes: ca.grupo2.intra
	Submit
	Realizar o download de todos os 4 certificados
	DER encoded certificate: 
	DER encoded certificate chain
	Base 64 encoded certificate
	Base 64 encoded certificate chain

	Server Manager, Tools, Internet Information Services (IIS) Manager
	SRV-CA-ISSUING1
	Duplo clique em Server Certificates
	Complete Certificate Request
	File name containing the certification authority's response: C:\Scripts\srv-ca-issuing1-der-encoded.cer
	Friendly name: ca.grupo2.intra
	Select a certificate store for the new certificate: Personal
	OK

	SRV-CA-ISSUING1, Sites, Default Web Site, Bindings
	Add
	Type: https
	SSL certificate: ca.grupo2.intra
	OK
	Close