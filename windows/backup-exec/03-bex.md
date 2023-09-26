#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023  
#Data de atualização: 26/09/2023 
#Versão: 0.02  

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

## Criando Jobs de Backup

```
Abra o Backup Exec, clique em Backup and Restore e abra o servidor dc01.grupo2.intra
Clique em Backup, Backup to Disk
Name: BKP-DC01
Em Backup (lado direito da tela), clique em Edit
Remova o backup Incremental
Agende o Backup Full para todas as sextas-feiras às 23h

Agora clique em Add a Backup Job e escolha Differential
Em Job template name, digite Diferencial
Agende o Backup Diferencial para todas as segundas, terças, quartas e quintas às 23h

Clique em Storage (lado esquerdo da tela) 
No Backup Full
Em Storage selecione: Backup em Disco
Em Keep for: 4 weeks
No Backup Diferencial
Em Storage selecione: Backup em Disco
Em Keep for: 4 weeks

Clique em Verify
No Backup Full
Verify the data: After job finishes, as a separate job
No Backup Diferencial
Verify the data: After job finishes, as a separate job
Clique em OK

Agora no canto esquerdo da tela, clique em Edit
Selecionar o Disco F: e o System State
Clique em OK
Clique em OK
Do not display this message again
Save the job without encryption

Clique com o botão direito em BKP-DC01-Full, clique em Run Now e depois em yes
```

## Restaurando Backup
```
Criar o diretório Restore em F:\
Abra o Backup Exec, clique em Backup and Restore e selecione Restore
File, folders, or volumes, Next
File and folder backups to a point-in-time, Next
Selecione o intervalo de data desejado, depois escolha o servidor, o volume, o tipo de backup a ser restaurado e os diretórios/arquivos desejados
Na simulação, escolhi o servidor dc01.grupo2.intra, unidade F:, Backup Full de 26/09 e Escolhi a pasta Backup
Next
To a different location, Browse
bex.grupo2.intra, F:, Restore
OK
Next
Recreate the directory structure from the backup when data is restored; otherwise, all data is restored without any directory structure
Overwrite the file on disk only if it is older
Restore files with their security information and file system permissions
Next
Next
Next
Name: restore-pasta-backup-dc01
Run now
Next
Finish
```
## Backup do Servidor Linux
```
Abra o Backup Exec, clique em Backup and Restore e abra o servidor dc01.grupo2.intra
Clique em Backup, Backup to Disk
Name: 192.168.56.10
Em Backup (lado direito da tela), clique em Edit
Remova o backup Incremental
Agende o Backup Full para todas as sextas-feiras às 23h

Clique em Storage (lado esquerdo da tela) 
No Backup Full
Em Storage selecione: Backup em Disco
Em Keep for: 4 weeks


Clique em Verify
No Backup Full
Verify the data: After job finishes, as a separate job


Agora no canto esquerdo da tela, clique em Edit
Clique em Root e escolha a pasta home
Clique em OK
Clique em OK

Clique com o botão direito em BKP-DC01-Full, clique em Run Now e depois em yes 
```
## Restaurando Backup Linux
```
Abra o Backup Exec, clique em Backup and Restore e selecione Restore
File, folders, or volumes, Next
File and folder backups to a point-in-time, Next
Selecione o intervalo de data desejado, depois escolha o servidor, o volume, o tipo de backup a ser restaurado e os diretórios/arquivos desejados
Next
To a different location, Browse
bex.grupo2.intra, F:, Restore
OK
Next
Recreate the directory structure from the backup when data is restored; otherwise, all data is restored without any directory structure
Lock the remote files if the mount points have the necessary permissions
Overwrite the file on disk only if it is older
Next
Next
Next
Name: restore-pasta-home-192.168.56.10
Run now
Next
Finish
```