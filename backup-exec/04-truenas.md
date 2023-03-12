#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023  
#Data de atualização: 11/03/2023  
#Versão: 0.01  
******************************************************************************************
TrueNas
RAM: 8GB
******************************************************************************************
Guia Geral  
Avançado  
Área de Transferência Compartilhada: Bi-direcional  
Arrastar e Soltar: Bi-direcional  
******************************************************************************************
Guia Sistema  
Placa-Mãe:   
Habilitar o I/O APIC  
Processador:   
    2 CPUs  
    Habilitar PAE/NX  
****************************************************************************************** 
Guia Monitor  
Memória de vídeo: 128MB   
Tela - Desmarcar Habilitar Aceleração 3D  
******************************************************************************************  
Guia Armazenamento  
Disco Rígido SATA 0 - Drive de estado sólido HD: 16GB - VDI (Sistema)  
Disco Rígido SATA 1 - Drive de estado sólido HD: 50GB - VDI (Dados)  
******************************************************************************************
Guia Áudio  
Desmarcar opção Habilitar Áudio  
******************************************************************************************
Guia Rede  
Adaptador 2 - Host-only (192.168.56.13)  
******************************************************************************************
Instalação  
1  
1  	
ada0 - VBOX HARDDISK -- 16.0 GiB  
Yes  
123@senac  
123@senac  
Boot via BIOS  
OK  
3 Reboot System  
Remover mídia de instalação  

Acessar pelo navegador o endereço http://192.168.56.108  
User: root  
Password: 123@senac  
***
Network, Interfaces  
em0, edit  
Desmarcar DHCP  
IP Address: 192.168.56.13/24  
***
Network, Global Configuration  
Hostname: truenas  
Domain: grupo2.intra  
Name Server 1: 192.168.56.11  
Name Server 2: 8.8.8.8  
Name Server 3: 8.8.4.4  
***
System General  
Time Zone: America/Sao_Paulo  
***
Storage, Pools, ADD  
Create new pool, Create pool  
Name: truenas-fs  
Mover ada1 de Available Disks para Data VDevs  
Force, Confirm, Continue (Utilizado apenas com finalidade educacional)  
Create, Confirm, Create Pool  
***
Directory Services, Active Directory  
Domain Name: grupo2.intra  
Domain Account Name: thanos  
Domain Account Password: 123@senac  
***
Sharing, Windows Shares, ADD