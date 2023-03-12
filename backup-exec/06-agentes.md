#Autor: Fagner Geraldes Braga  
#Data de criação: 11/03/2023  
#Data de atualização: 11/03/2023  
#Versão: 0.01  
******************************************************************************************
Servidor BEX  
O agente já é instalado por padrão ao realizar a instalação do Backup Exec  
***
Servidor DC01  
Abrir o Veritas Backup Exec no Servidor BEX 
Backup and Restore  
Add Server  
Microsoft Windows computers and servers  
Marcar: Allow Backup Exec to establish a trust with the servers  

dc01.grupo2.intra - System Logon Account  

Marcar: Upgrade the Backup Exec Agent for Windows to the current version automatically  
Marcar: Restart remote computer automatically after installing the Backup Exec Agent for Windows when a restart is required  
***
Servidor srv-ubuntu  
Abrir a mídia do Backup Exec, abrir a pasta Unix e copiar o arquivo RALUS_RMALS-1193.1338.tar.gz para o servidor Ubuntu  
Utilisei o webmin para realizar o processo  
https://192.168.56.10:11000  
User: senac  
Password: 123@senac  

Tools, File Manager  
/home/senac  
File, Upload to current directory  
Adicionar o arquivo RALUS_RMALS-1193.1338.tar.gz,  marcar a opção Extract Compressed e clicar em Upload  

Abrir o terminal do webmin  
Tools, Terminal  
cd /home/senac/RALUS_RMALS-1193.1338/  
./installralus  
Enter  
Enter  
Enter  
Enter  
Enter  
y  
n  
n  
Enter  
Enter  
Enter  
y  
Enter  

Adicionar usuário senac ao grupo beoper  
adduser senac beoper  

Abrir o Veritas Backup Exec no Servidor BEX 
Backup and Restore  
Add Server  
Unix computer  
Marcar: Allow Backup Exec to establish a trust with the servers  

srv-ubuntu.grupo2.intra 
Logon Account - Add/Edit 
Add  
User name: senac  
Password: 123@senac  
Confirm password: 123@senac  
***
Servidor srv-rockylinux 
Abrir a mídia do Backup Exec, abrir a pasta Unix e copiar o arquivo RALUS_RMALS-1193.1338.tar.gz para o servidor Ubuntu  
Utilisei o webmin para realizar o processo  
https://192.168.56.14:11000  
User: root  
Password: 123@senac  

Tools, File Manager  
/root  
File, Upload to current directory  
Adicionar o arquivo RALUS_RMALS-1193.1338.tar.gz,  marcar a opção Extract Compressed e clicar em Upload  

Abrir o terminal do webmin  
Tools, Terminal  
cd /root/RALUS_RMALS-1193.1338/  
./installralus  
Enter  
Enter  
Enter  
Enter  
Enter  
y  
n  
y  
Enter  
Enter  
Enter  
y  
Enter  

Abrir o Veritas Backup Exec no Servidor BEX 
Backup and Restore  
Add Server  
Unix computer  
Marcar: Allow Backup Exec to establish a trust with the servers  

srv-rockylinux 
Logon Account - Add/Edit 
Add  
User name: root  
Password: 123@senac  
Confirm password: 123@senac  


