#Autor: Fagner Geraldes Braga  
#Data de criação: 19/10/2023    
#Data de atualização: 19/10/2023  
#Versão: 0.01  

## Validar se a pasta Sysvol está pronta para migração
Abra o Prompt de comando como Administrator e digite os comandos abaixo
```
dcdiag /e /test:sysvolcheck /test:advertising 
repadmin /showrepl
```
## Procedimento para migração da pasta Sysvol para DFRS
Abra o Prompt de comando como Administrator e digite os comandos abaixo
```
dfsrmig /getglobalstate
dfsrmig /setglobalstate 1
dfsrmig /getmigrationstate
dfsrmig /setglobalstate 2 (Obs: Aguardar entre 10 a 60 minutos)
dfsrmig /getmigrationstate
dfsrmig /setglobalstate 3 (Obs: Aguardar entre 10 a 60 minutos)
dfsrmig /getmigrationstate
```
### Após finalizar todas as etapas, fazer as seguintes validações:  
Verificar se o serviço de FRS nos servidores de AD está parado  
Verificar se a pasta SYSVOL_DFSR localizada em C:\Windows foi criada
