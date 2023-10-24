#Autor: Fagner Geraldes Braga  
#Data de criação: 18/10/2023    
#Data de atualização: 18/10/2023  
#Versão: 0.01  

# Migração AD - Windows Server 2008 para 2022

```
DC01 - Windows Server 2008 R2
Roles: ADDS e DHCP
IP: 192.168.10.1
Máscara: 255.255.255.0
Gateway: 192.168.10.254
DNS: 192.168.10.1
```
```
DC02 - Windows Server 2008 R2
Roles: ADDS
IP: 192.168.10.2
Máscara: 255.255.255.0
Gateway: 192.168.10.254
DNS: 192.168.10.2, 192.168.10.1
```
```
DC03 - Windows Server 2022
Roles: ADDS e DHCP
IP: 192.168.10.3
Máscara: 255.255.255.0
Gateway: 192.168.10.254
DNS: 192.168.10.3, 192.168.10.1, 192.168.10.2
```
```
DC04 - Windows Server 2022
Roles: ADDS
IP: 192.168.10.4
Máscara: 255.255.255.0
Gateway: 192.168.10.254
DNS: 192.168.10.4
```