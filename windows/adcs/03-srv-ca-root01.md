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
	* 01-ca-root.ps1

## Configurando ADCS 
### Se já tiver executado o script 01-ca-root.ps1 não precisa executar os comandos do bloco CA ROOT STANDALONE
### CA ROOT STANDALONE
	Server Manager –> Manage –> Add Role and Features
	Role-based or feature-based installation
	Select a server from the server pool
	srv-ca-root01
	Active Directory Certificate Services
	Certification Authority
	Configure Active Directory Certificate Services on the destination server
	Credentials: SRV-CA-ROOT01\Administrator
	Certification Authority
	Standalone CA
	Root CA
	Create a new private key
	Cryptographic provider: RSA#Microsoft Software Key Storage Provider
	Key length: 2048
	Hash algorithm: SHA256
	Common name for this CA: SRV-CA-ROOT01
	Preview of distinguished name: CN=SRV-CA-ROOT01
	Validity period: 5 years
	Certificate database location: C:\Windows\system32\CertLog
	Certificate database log location: C:\Windows\system32\CertLog
### Assinando Digitalmente a CA Subordinada
	Após ter configurado o ADCS no servidor srv-ca-issuing1 e ter gerado o certificate request file, copiá-lo para o servidor srv-ca-root01
	Server Manager, Tools, Certification Authority
	Clique com o direito em SRV-CA-ROOT01, All Tasks, Submit new request...
	Insira o caminho onde foi salvo o certificado
	Vá para SRV-CA-ROOT01, Pending Requests
	Clique com o direito no certificado pendente, vá em All Tasks e selecione Issue
	Agora clique em Issued Certificates e dê dois cliques no certificado emitido
	Clique na aba Details e depois em Copy to File...
	Next
	Cryptographic Message Syntax Standard - PKCS #7 Certificates (.P7B)
	Include all certificates in the certification path if possible
	Browse:  C:\Temp\srv-ca-issuing1-signed.p7b Save
	Next
	Finish
	OK