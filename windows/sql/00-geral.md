#Autor: Fagner Geraldes Braga  
#Data de criação: 09/11/2023    
#Data de atualização: 09/11/2023  
#Versão: 0.01 

# Windows Server 2002 Standard  
```
Memória: 8GB
Processador: 2 cores
Controladora SCSI 1
Disco 0 - 60GB - SO
Controladora SCSI 1 
Disco 0 - 50GB - Bases 
Disco 1 - 50GB - Logs 
```
## Instalar Windows Server 2022 Standard (Experiência Desktop)
```
Instalação Personalizada  
Um disco com partição de 60GB para SO 
```
## Windows Update  
```
Baixar e Instalar Atualizações disponíveis  
```
## UAC  
```
Nunca notificar  
```
## Propriedades do Sistema (Windows Pause + Break)  
```
Guia Avançado, Desempenho - Ajustar para obter um melhor desempenho  
Guia Remoto  
	Marcar Permitir conexões remotas com este computador  
```
## Gerenciador de Servidores  
```
Configuração de Segurança Aprimorada do IE  
	Administradores - Desligada  
	Usuários - Ligada  
```
## BGinfo  
```
Copiar pasta Scripts em C:\  
Colocar atalho do logon.vbs para executar na Inicialização do Sistema  
	C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp  
```
## Windows  
```
Usuário: Administrator  
Senha: 123@senac 
```
## Configuração dos discos
```
Pressione as teclas Winkey + X e depois clique em Disk Management
Clique com o direito em Disk 1 e clique em Online
Clique com o direito em Disk 1 e clique em Initialize Disk
Selecione o disco 1 e marque a opção GPT e clique em OK
Clique com o direito na parte não alocada e depois clique em New Simple Volume
Clique em Next
Clique em Next
Em Assign the following drive letter selecione a opção F
Clique em Next
Em Volume label digite Bases
Clique em Next
Clique em Finish

Clique com o direito em Disk 2 e clique em Online
Clique com o direito em Disk 2 e clique em Initialize Disk
Selecione o disco 2 e marque a opção GPT e clique em OK
Clique com o direito na parte não alocada e depois clique em New Simple Volume
Clique em Next
Clique em Next
Em Assign the following drive letter selecione a opção L
Clique em Next
Em Volume label digite Logs
Clique em Next
Clique em Finish
```
## Criando as pastas
```
Pressione as teclas Winkey + E para abrir o Explorador de Arquivos
Clique em This PC e selecione o disco F:
Crie o diretório Bases
Clique em This PC e selecione o disco L:
Crie o diretório Logs
```