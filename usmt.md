#Autor: Fagner Geraldes Braga  
#Data de criação: 25/11/2021  
#Data de atualização: 18/12/2021  
#Versão: 0.03
***
USMT
***
Pasta do USMT está no HD Externo
***
Computador de Origem  
Logar como administrador  
Abrir o Prompt de Comando como Administrador e acessar a pasta do USMT  
Executar o comando  
scanstate C:\temp\bkp /v:13 /i:migapp.xml /i:miguser.xml /ue:* /ui:crfsp\marcion /o
***
Computador de Destino  
Logar como administrador  
Abrir o Prompt de Comando como Administrador e acessar a pasta do USMT  
Executar o comando  
loadstate C:\temp\bkp /v:13 /i:migapp.xml /i:miguser.xml /c
***
