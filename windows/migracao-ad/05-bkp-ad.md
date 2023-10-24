#Autor: Fagner Geraldes Braga  
#Data de criação: 18/10/2023    
#Data de atualização: 18/10/2023  
#Versão: 0.01  

## Realizar o Backup do AD Principal (DC01) - Versão Bare metal
```
Abrir o Server Manager
Clicar com o direito em Features e depois em Add Features
Selecione Windows Server Backup Features 
Selecione Windows Server Backup e Command-line Tools e clique em Next
Clique em Install
Quando a instalação terminar, clique em Close
Pressione as teclas winkey + R para abrir o Executar
Digite wbadmin.msc e pressione Enter
Clique em Backup Once...
Selecione Different options e clique em Next
Selecione Full server e clique em Next
Selecione Remote shared folder e clique em Next
Aponte uma pasta compartilhada na rede onde o backup possa ser salvo e clique em Next
Ex: \\dc02\dc02
Clique em Backup
Ao finalizar clique em Close
```
## Realizar o Backup do AD Principal (DC01) - Versão Veeam
```
Instalar .NetFramework 4.8
Instalar o agente do Veeam
```
### Criar mídia de Boot do Veeam
```
Clique em Start, All Programs, Veeam, Tools, Create Recovery Media
Next
OK
ISO file name and Location: \\dc02\dc02\VeeamRecoveryMedia_DC01.iso
Next
Create
Finish
```
### Criar backup completo
```
Clique em Start, All Programs, Veeam, Tools, Configure Backup
Name BKP-DC01
Next
Entire computer
Next
Shared folder
Next
\\dc02\dc02
Next
Desmarcar a opção Daily at
Apply
Marca a opção Run the job when I click Finish
Finish
No
```