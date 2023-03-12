#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023 
#Data de atualização: 11/03/2023  
#Versão: 0.01  
***
Rocky Linux 9.1
RAM: 2GB  
HD: 50 - VDI  
***
Guia Geral  
  Avançado  
    Área de Transferência Compartilhada: Bi-direcional  
    Arrastar e Soltar: Bi-direcional  
***
Guia Sistema  
Placa-Mãe:   
Habilitar o I/O APIC  
Relógio da máquina retorna hora UTC  

Processador:   
    2 CPUs  
    Habilitar PAE/NX  
***  
Guia Monitor  
Memória de vídeo: 128MB   
Tela - Desmarcar Habilitar Aceleração 3D  
***    
Guia Armazenamento  
Disco Rígido SATA 0 - Drive de estado sólido  
***
Guia Áudio  
Desmarcar opção Habilitar Áudio  
***
Guia Rede  
Adaptador 1 - Host-only (192.168.56.13)  
***
Instalação do Rocky Linux 9.1  
English, English (United States) - Continue
Keyboard Portuguese (Brazil) - Done 

Time & Date
Region: Americas City: Sao Paulo - Done
  
Network & Hostname 
enp0s3 
Configure  
IPv4 Settings  
Method: Manual  Add  
Address: 192.168.56.13  
Netmask 24  
Gateway: 192.168.56.254   
DNS servers: 192.168.56.11  
Search domains: grupo2.intra  
Save  
Hostname: srv-rockylinux - Apply  
Done  

Software Selection  
Server

Installation Destination  
Done  

Root Password  
123@senac  
123@senac  
Desmarcar: Lock root account  
Marcar: Allow root SSH login with password  
Done  
Begin Installation  
Reboot System  

systemctl enable --now cockpit.socket  
yum update -y  

dnf -y install perl perl-Net-SSLeay perl-Encode-Detect libnsl  
dnf -y install  http://download.webmin.com/download/yum/webmin-2.013-1.noarch.rpm  
vim /etc/webmin/miniserv.conf   
port 11000  
listen 11000  
systemctl restart webmin   
firewall-cmd --add-port=11000/tcp --permanent  
firewall-cmd --add-port=10000/tcp --permanent  
firewall-cmd --add-port=6101/tcp --permanent  
firewall-cmd --add-port=3527/tcp --permanent  
firewall-cmd --add-port=6106/tcp --permanent  
firewall-cmd --add-port=5633/tcp --permanent  
firewall-cmd --add-port=50104/tcp --permanent  
firewall-cmd --add-port=10082/tcp --permanent  
firewall-cmd --add-port=10102/tcp --permanent  
firewall-cmd --add-port=60000-61000/tcp --permanent 
***
Inserindo servidor srv-rockylinux no domínio  
dnf -y install realmd sssd oddjob oddjob-mkhomedir adcli samba-common-tools krb5-workstation   
nmcli connection modify enp0s3 ipv4.dns 192.168.56.11  
realm discover GRUPO2.INTRA  
realm join GRUPO2.INTRA -U thanos  
realm list  

