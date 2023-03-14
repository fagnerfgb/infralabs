#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023  
#Data de atualização: 11/03/2023  
#Versão: 0.01  

# Windows Server 2002 Standard  

## Guia Geral  
	* Avançado  
		* Área de Transferência Compartilhada: Bi-direcional  
		* Arrastar e Soltar: Bi-direcional  
## Guia Sistema  
	* Placa-Mãe:   
		* Memória Base: 8192 MB
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
	* Disco Rígido SATA 2 - Drive de estado sólido HD: 50GB - VDI (Backup)    
## Guia Áudio  
	* Desmarcar opção Habilitar Áudio  
## Guia Rede  
	* Adaptador 1 - Host-only (192.168.56.12)    
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

## Copiar pasta BEX em C:\ 
	* Executar o arquivo share.reg  
	* Abrir o Powershell ISE como Administrador e executar os scripts na seguinte ordem:  
	* 00-config.ps1  
	* 01-dominio.ps1 

## Instalação Backup Exec  
	* English  
	* Install Products  
	* Backup Exec  
	* I accept the terms of the license agreement.  
	* Typical installation  

	* User name: grupo2\thanos  
	* Password: 123@senac  

## Criação do storage para armazenamento do Backup  
	* Abrir Veritas Backup Exec  
	* Storage  
	* Configure Storage  
	* Disk-base Storage  
	* Disk storage  
	* Name: Backup em Disco  
	* Description: Unidade de Armazenamento para realização de backup em disco dos servidores  

	* Local disk: F:  
	* Concurrent write operations: 8  

## Criação do storage de Rede para armazenamento do Backup  (Em Validação)
	* Abrir Veritas Backup Exec  
	* Storage  
	* Configure Storage  
	* Disk-base Storage  
	* Disk storage  
	* Name: Backup em Rede - srv-ubuntu  
	* Description: /home/samba/bkp 

	* Network Share: \\srv-ubuntu\bkp  
	* Concurrent write operations: 8  

## Liberação de Portas  
	* Abrir Veritas Backup Exec    
	* Configuration and Settings  
	* Backup Exec Settings  
	* Network and Security  
	* Enable TCP dynamic port range: 60000 - 61000  
