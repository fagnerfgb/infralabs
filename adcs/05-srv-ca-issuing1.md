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