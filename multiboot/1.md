#Autor: Fagner Geraldes Braga  
#Data de criação: 08/11/2021  
#Data de atualização: 18/12/2021  
#Versão: 0.01
***  
# Formatação de computadores

## BIOS  
MBR  
HD no máximo de 2TB  
Sem suporte a mouse 
Inicialização mais lenta 

## UEFI
GPT  
HD no máximo de 9.4ZB  
Possui emulação de BIOS para rodar sistemas legados  
Com suporte a mouse  
Inicialização mais rápida  
Fast Boot
***
# Estrutura de Partições
Partição = divisão do disco em partes

## MBR
Capacidade Máxima: 2TB  
Total de partições: 4 primárias

## GPT
Capacidade Máxima: 9.4ZB   
Total de partições: ilimitado  
Windows limita a 128 partições
***
# Sistemas de Arquivos
## Windows
### FAT32
Velocidade  
Capacidade Máxima por volume de arquivo: 4GB  
Capacidade Máxima da partição: 2TB  
Maior compatibilidade com dispositivos em geral

### NTFS
Journaling (Verificação para integridade dos dados)  
Criptografia  
Capacidade Máxima por volume de arquivo: Tamanho da Partição  
Capacidade Máxima da partição: 256TB 

***
## Linux
### EXT4
### JFS
### REISERFS
### XFS 
***
# Sistemas Operacionais
## Arquitetura de Sistemas Operacionais
### x86 - 32 Bits
Só funciona em 32 Bits  
Reconhece no máximo 4GB de RAM

### x64 - 64 Bits
Funciona tanto em 32 como em 64 Bits  
***
# Softwares Utilizados
[ISO Windows 10 21H2](https://go.microsoft.com/fwlink/?LinkId=691209)  
[ISO Windows 11 21H2](https://go.microsoft.com/fwlink/?linkid=2156295)  
[ISO Linux Mint](https://mirrors.layeronline.com/linuxmint/stable/20.2/linuxmint-20.2-cinnamon-64bit.iso)  
[DriverPack](https://dl.driverpack.io/17-online/DriverPack-17-Online.exe)  
[DriverPack Network](https://dl.driverpack.io/builds/DriverPack_17.10.14-21113_Network.exe)  
[7Zip](https://www.7-zip.org/a/7z2106-x64.exe)  
[PhotoScape](https://dw.uptodown.com/dwn/TcokB5AZWZpA5GMYZ4ML6e0_r3htmy61xvc6S1oDWeFEtVWpNB9wQpXIU3ma6Xx7o3iJXr5G-QKC5QY6bHMm18TT8lHy8xYnGpWDPpBispWm7PGVlIq_1ZAuhSYsZ0JU/BOEMd89X1XB6rUE9inqlqx3_J3EZ_WS9o1ZYBQ9x_SrQ7fo0zz37spL7OzW8Qn0AFWSp3Y38L5iDkgFNcMPAzxzzLwtXVDNmNXLevfJHps5UPO4s_1FZ-MeNg5Vt_87d/1avFh6NfmDF7ekeskUsdBDt46TA9CGc0O9lWdHgWwCV-kG7TNkqC19szYgs5KajpHeNhAR7Pk2crLUBhKWhmxQ==/)  
[Oracle VirtualBox](https://download.virtualbox.org/virtualbox/6.1.30/VirtualBox-6.1.30-148432-Win.exe)  
[Oracle VM VirtualBox Extension Pack](https://download.virtualbox.org/virtualbox/6.1.30/Oracle_VM_VirtualBox_Extension_Pack-6.1.30.vbox-extpack)  
[WinSetupFromUSB](http://www.winsetupfromusb.com/files/download-info/winsetupfromusb-1-10-exe/)  
[GFX](https://gfx-boot-customizer.software.informer.com/download/)
***
# Modificando ISO do Windows 10

Selecione a ISO do Windows 10, clique com o botão direito do mouse, selecione 7-Zip e depois clique em Extrair Para "Nome da Imagem"  
Copiar o arquivo ei.cfg que está na pasta XXX  
Colar o arquivo ei.cfg na pasta sources que fica dentro do diretório extraído da imagem ISO Windows 10
Abrir a pasta windows-deployment e Executar o arquivo Windows Deployment Tools-x86_en-us.msi  
Recortar a pasta com a imagem extraída do Windows 10 e colar no diretório C:\

Clique em Iniciar, Windows Kits  
Clicar com o botão direito em Deployment and Imaging Tools Environment e Executar como Administrador

Copiar o comando abaixo e colá-lo no Prompt de Comando aberto no passo anterior

```powershell
oscdimg -u2 -m -bC:\W10-21H2\boot\etfsboot.com C:\W10-21H2 C:\W10-21H2.iso
# C:\W10-21H2 é o nome do diretório onde salvei a imagem extraída do Windows 10
# A ISO modificada será salva em C:\ e terá o nome W10-21H2.iso
```


# Modificando ISO do Windows 11

Selecione a ISO do Windows 11, clique com o botão direito do mouse, selecione 7-Zip e depois clique em Extrair Para "Nome da Imagem"  
Copiar o arquivo ei.cfg que está na pasta XXX  
Colar o arquivo ei.cfg na pasta sources que fica dentro do diretório extraído da imagem ISO Windows 11
Abrir a pasta windows-deployment e Executar o arquivo Windows Deployment Tools-x86_en-us.msi  
Recortar a pasta com a imagem extraída do Windows 11 e colar no diretório C:\

Clique em Iniciar, Windows Kits  
Clicar com o botão direito em Deployment and Imaging Tools Environment e Executar como Administrador

Copiar o comando abaixo e colá-lo no Prompt de Comando aberto no passo anterior

```powershell
oscdimg -u2 -m -bC:\W11-21H2\boot\etfsboot.com C:\W11-21H2 C:\W11-21H2.iso
# C:\W11-21H2 é o nome do diretório onde salvei a imagem extraída do Windows 11
# A ISO modificada será salva em C:\ e terá o nome W11-21H2.iso
```
***
# Criando Pendrive Bootável

Abrir o Prompt de Comando como Administrador
```cmd
diskpart

list disk
rem Lista os discos conectados ao computador

select disk 2 
rem Seleciona o disco que deverá ser particionado e formatado
rem No meu caso foi o disco 2

clean
rem Limpa o pendrive
rem Caso tenha dados importantes, realize o backup antes de executar este comando

create partition primary
rem Cria uma partição primária

assign letter F
rem Atribui uma letra para o disco
rem No meu caso, utilizei a letra F

exit
rem Sai do Diskpart

exit
rem Sai do Prompt de Comando
```
Formatar o disco

# Adicionando Sistemas

Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais
Clique em RMPrepUSB  
Clique em CTRL Z  
Na opção 2 - Nome do Volume - Nomeie o seu Disco "SO - FGB"  
Na opção 3 - Opções de Boot - Selecione WinPEv2/WinPEv3/Vista/Win7 bootable  
Na opção 4 - Arquivos de Sistema e Atualizações, selecione FAT32 e Boot as HDD (C: 2PTNS)  
Clique na opção 6 - Preparar o PenDrive  
Clique em OK  
Clique em OK  
Clique em Instalar Grub4dos  
Clique em Sim
Clique em OK  
Pressione Enter  
Clique em OK  
Clique em Sair  
***
## Windows 11
Selecione o Disco que receberá os Sistemas Operacionais   
Em Add to USB disk clique em Windows Vista/7/8/10/11/Server 2008/2012+ based ISO
Selecione a ISO do Windows 11  
Clique em GO  
Aguarde o processo e clique em OK  
***
## Windows 10
Selecione o Disco que receberá os Sistemas Operacionais   
Em Add to USB disk clique em Windows Vista/7/8/10/11/Server 2008/2012+ based ISO
Selecione a ISO do Windows 10  
Clique em GO  
Aguarde o processo e clique em OK
***
## Linux Mint
Selecione o Disco que receberá os Sistemas Operacionais   
Em Add to USB disk clique em Linux ISO/Other Grub4dos compatible ISO
Selecione a ISO do Linux Mint  
Dê um nome para aparecer no Menu de Inicialização  
Inseri Linux Mint
Clique em GO  
Aguarde o processo e clique em OK
***
## Personalizando o Menu do Pendrive
Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais  
Clique em Bootice  
Clique na aba Utilities  
Clique em Start Menu Editor
Clique em Abrir e selecione o arquivo menu.lst que está no pendrive recém criado com os múltiplos sistemas operacionais  
Alterar o timeout de 10 para 30  
Alterar title Windows NT6 (Vista/7 and above) Setup para:  
title Windows 
***
Alterar title Second part/continue NT6 Setup (Boot first internal disk) para:  
title Iniciar HD do Sistema
***
Alterar title LinuxMint from partition 0 para:  
title Linux Mint
***
Clique em Salvar (Disquete com a letra A)  
Clique em Salvar (Disquete com a letra U)
***
Caso o Linux não apareça no menu, realizar o seguinte procedimento:   
Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais  
Clique em Bootice  
Clique na aba Utilities  
Clique em Start Menu Editor
Clique em Abrir e selecione o arquivo menu.lst que está no pendrive recém criado com os múltiplos sistemas operacionais

```bash
title NOME DA OPCAO NO MENU
map --unmap=0:0xff
map --unhook && map --rehook
cat --hex --locate=PoLPu@ (md)0x3D0+0x130 > nul && echo Cannot continue if PLoP is active, please start this entry without loading PLoP first && echo && pause Press any key to return to the main menu && configfile /menu.lst
set /a dev=*0x8280&0xff
root (%dev%,0)
set ISO=/ISO/NOME DO ARQUIVO.iso
ls %ISO% > nul || find --set-root --devices=hf /usbdrive.tag|| echo Error! Could not find usbdrive.tag && echo  && pause Press any key to return to the main menu && configfile /menu.lst
ls %ISO% > nul || find --set-root --devices=hf %ISO% || echo Error! Could not find %ISO% && echo  && pause Press any key to return to the main menu && configfile /menu.lst
map %ISO% (0xff) || map --heads=0 --sectors-per-track=0 %ISO% (0xff) || echo FATAL ERROR mapping %ISO%, please check if file is present and defragmented && pause Press any key to return to main menu && configfile /menu.lst
#http://reboot.pro/topic/9916-grub4dos-isohybrided/page-2#entry88531
#http://www.rmprepusb.com/tutorials/tails
set /a dev=*0x82a0&0xff
debug 1
parttype (%dev%,3) | set check=
debug off
set check=%check:~-5,4%
if "%check%"=="0x00" partnew (%dev%,3) 0 0 0 && partnew (%dev%,3) 0x00 %ISO%
if not "%check%"=="0x00" echo WARNING: PARTITION TABLE 4 IN BIOS DEVICE %dev% IS ALREADY IN USE! && echo  && echo To prevent possible data loss will not continue further && pause && configfile /menu.lst
map --rehook
root (0xff)
chainloader (0xff)
```
Em title, colocar o nome que você quer que apareça no Menu  
Em set ISO=/ISO/NOME DO ARQUIVO.iso, substitua NOME DO ARQUIVO, pelo nome da ISO do Linux que está dentro do Pendrive  
***
Clique em Salvar (Disquete com a letra A)  
Clique em Salvar (Disquete com a letra U)
***
Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais  
Clique em Bootice  
Clique na aba BCD  
Clique em Other BCD File  
No pendrive, clique na pasta boot, depois em bcd e clique em abrir  
Clique em Easy Mode 
*** 
Clique em ...Back to Main Menu(Grub4dos) e na opção OS title: digite:  
...Voltar ao menu principal  
Clique em Save globals  
Clique em Save current system 
*** 
Clique no Windows 11 e altere a opção OS title para:  
Windows 11 21H2  
Clique em Save globals  
Clique em Save current system  
***
Clique no Windows 10 e altere a opção OS title para:  
Windows 10 21H2  
Clique em Save globals  
Clique em Save current system  
***
Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais  
Clique em Bootice  
Clique na aba BCD  
Clique em Other BCD File  
No pendrive, clique na pasta efi, depois microsoft, depois em boot  
Clique no arquivo bcd e clique em abrir  
Clique em Easy Mode  

*** 
Clique no Windows 11 e altere a opção OS title para:  
Windows 11 21H2  
Clique em Save globals  
Clique em Save current system  
***
Clique no Windows 10 e altere a opção OS title para:  
Windows 10 21H2  
Clique em Save globals  
Clique em Save current system  
***
## Personalizando a parte gráfica do Menu
Abra o Programa GFX-Boot Customizer.exe  
Clique em Sprache e selecione Portuguese-BR  
Na opção 1 - Selecione a imagem desejada para ser a imagem de fundo do menu  
Na opção 2 - Selecione uma logo, você pode adicionar uma imagem com o logotipo da sua empresa  
Na opção 3 - Selecione o tipo de menu  
Eu escolhi a opção 3 e selecionei a opção Sem status no bar  
Vá ajustando e clicando em Recalcular o Preview até que a imagem esteja ao seu gosto  
Clique em Aplicar configurações  
Copie o arquivo com extensão GFX gerado para a raiz do Pendrive
***
 Abrir o programa WinSetupFromUSB_1-10_x64 como Administrador  
Clicar em Advanced Options
Selecionar a opção Display disk drives on all interfaces, not only USB e depois clique em OK  
Selecione o Disco que receberá os Sistemas Operacionais   
Clique em Bootice  
Clique na aba Utilities  
Clique em Start Menu Editor
Clique em Abrir e selecione o arquivo menu.lst que está no pendrive recém criado com os múltiplos sistemas operacionais  
Logo abaixo de timeout digite gfxmenu /NOME.GFX  
No meu arquivo ficou da seguinte forma: gfxmenu /FGB.GFX  
Clique em Salvar (Disquete com a letra A)  
Clique em Salvar (Disquete com a letra U)  
***
No Pendrive, pressione as teclas Ctrl + A para selecionar tudo, clique com o botão direito do Mouse, vá em Propriedades, clique em Ocultar e depois em Aplicar  
Selecione a opção Aplicar as alterações aos itens selecionados, subpastas e arquivos e depois clique em OK  
Criar uma pasta no Pendrive e copiar o DriverPack e o DriverPack-Network
***




