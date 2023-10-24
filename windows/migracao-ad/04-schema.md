#Autor: Fagner Geraldes Braga  
#Data de criação: 18/10/2023    
#Data de atualização: 18/10/2023  
#Versão: 0.01  

## Como Descobrir o Schema Master do Ambiente
### Opção 1 - Prompt de Comando
Abrir o cmd como administrador
```
netdom query fsmo
```
### Opção 2 - PowerShell
Abrir o Active Directory Module for Windows PowerShell como administrador
```
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster
```

## Como Descobrir a versão do Active Directory
Abrir o Active Directory Module for Windows PowerShell como administrador
```
Get-ADObject (Get-ADRootDSE).schemaNamingContext -Property objectVersion
```

