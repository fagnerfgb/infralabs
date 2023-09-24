#Autor: Fagner Geraldes Braga  
#Data de criação: 24/09/2023    
#Data de atualização: 24/09/2023  
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
	* Disco Rígido SATA 0 - Drive de estado sólido HD: 60GB - VDI (Sistema)  
	* Disco Rígido SATA 1 - Drive de estado sólido HD: 50GB - VDI (WDS) 
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
	* 01-ad.ps1  
	* 02-dns.ps1
## Abrir a pasta Scripts em C:\ e executar os arquivos .bat na seguinte ordem:  
	* 01-cria_ou.bat  
	* cria_grupos_ad.bat  
	* cria_usuarios.bat  
## Abrir o Powershell ISE como Administrador e executar os scripts na seguinte ordem:  
	* adiciona-usuario-a-grupo.ps1 (Este script apresenta erro ao executar, mas os usuários são atribuídos aos grupos correspodentes)  
	* 03-sites.ps1
	* 04-dhcp.ps1
	* 05-wds.ps1
## Captura de Imagens
No File Explorer vá para W:\RemInstall e crie o diretório Captura
No WDS, srv-dc01.grupo2.intra, Boot Images, clique com o botão direito do mouse em W10 22H2 Pro e selecione Create Capture Image...
Image Name: W10 22H2 Pro
Image Description: W10 22H2 Pro
Location and file name: W:\RemInstall\Captura\w10-22h2-pro.wim
Next
Esta parte demora um pouco para finalizar.

 
