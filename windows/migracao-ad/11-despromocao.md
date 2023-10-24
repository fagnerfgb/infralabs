#Autor: Fagner Geraldes Braga  
#Data de criação: 23/10/2023    
#Data de atualização: 23/10/2023  
#Versão: 0.01  

## Alterar IP e DNS dos DCs
### DC01   
```
Pressione as teclas winkey + R para abrir o Executar
Digite ncpa.cpl e pressione Enter
Clique com o botão direito na placa de rede e depois clique em Properties
Selecione Internet Protocol Version 4 (TCP/IPv4) e clique em Properties
Em IP address insira o endereço 192.168.10.11
Em Preferred DNS Server insira o endereço 192.168.10.1 e 192.168.10.2
Clique em OK e depois clique em Close
```
### DC02 
```
Pressione as teclas winkey + R para abrir o Executar
Digite ncpa.cpl e pressione Enter
Clique com o botão direito na placa de rede e depois clique em Properties
Selecione Internet Protocol Version 4 (TCP/IPv4) e clique em Properties
Em IP address insira o endereço 192.168.10.12
Em Preferred DNS Server insira o endereço 192.168.10.1 e 192.168.10.2
Clique em OK e depois clique em Close
```
### DC03 
```
Pressione as teclas winkey + R para abrir o Executar
Digite ncpa.cpl e pressione Enter
Clique com o botão direito na placa de rede e depois clique em Properties
Selecione Internet Protocol Version 4 (TCP/IPv4) e clique em Properties
Em IP address insira o endereço 192.168.10.1
Em Preferred DNS Server insira o endereço 192.168.10.1 e 192.168.10.2
Clique em OK e depois clique em Close
```
### DC04 
```
Pressione as teclas winkey + R para abrir o Executar
Digite ncpa.cpl e pressione Enter
Clique com o botão direito na placa de rede e depois clique em Properties
Selecione Internet Protocol Version 4 (TCP/IPv4) e clique em Properties
Em IP address insira o endereço 192.168.10.2
Em Preferred DNS Server insira o endereço 192.168.10.2 e 192.168.10.1
Clique em OK e depois clique em Close
```
Após alterar, reiniciar os DCs

Validar no servidor DNS se as alterações foram refletidas

## Despromover os servidores DC01 e DC02
```
Pressione as teclas winkey + R para abrir o Executar
Digite dcpromo e pressione Enter
Clique em Next
Clique em OK
Clique em Next
Digite um password para a conta Administrator deste servidor
Clique em Next
Clique em Next
Clique em Finish
Clique em Restart Now
```
## Remover servidores DC01 e DC02 do domínio
```
Pressione as teclas Windows + Pause/Break
Clique em Change settings
Clique em Change
Selecione Workgroup e digite grupo2
Insira as credenciais de administrator do domínio e pressione OK
Clique em OK
Clique em OK
Clique em Close
Clique em Restart Now
```