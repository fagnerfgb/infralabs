#Autor: Fagner Geraldes Braga  
#Data de criação: 09/11/2023    
#Data de atualização: 09/11/2023  
#Versão: 0.01 

## Requisitos da base de dados
```
A base de dados e de log devem estar em diretórios diferentes
Nome da Base: dbVendas
Tamanho inicial de 100 MB
Tamanho máximo dos arquivos de 200 MB
Taxa de crescimento de 50 MB
```

## Criação de tabelas
```
Copiar o arquivo Video+2.3.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo Video+2.3.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Entrada de dados
```
Copiar o arquivo entrada-dados.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo entrada-dados.sql em F:\Scripts e clique em Open
Selecione as 3 primeiras linhas da consulta e execute-as
```
## Contagem de notas fiscais
```
Copiar o arquivo count.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo count.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Otimizar a base de dados
```
Copiar o arquivo otimiza.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo otimiza.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Excluir uma base de dados
```
DROP DATABASE [VENDAS];
```
## Realizar backup completo
```
Pressione as teclas Winkey + E para abrir o Explorador de Arquivos
Clique em This PC e selecione o disco L:
Crie o diretório Backups

Copiar o arquivo backup.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo backup.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Realizar restore completo
```
Copiar o arquivo restore.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo restore.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Política de Backup
```
Copiar o arquivo politica-backup.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo politica-backup.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Política de Restore
```
Copiar o arquivo politica-restore.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo politica-restore.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
## Criando Usuários
### Criando usuário no Windows
```
Pressione as teclas Winkey + X e depois clique em Computer Management
Clique em Local Users, Users
Clique com o direito e depois clique em New User
User Name: Fagner.Braga
Full Name: Fagner Geraldes Braga
Password: 123@senac
Confirm Password: 123@senac

Deixe marcada apenas as caixas abaixo
User cannot change password
Password never expires
Clique em Create e depois em Close
```
### Adicionando usuário ao grupo Administrators do Windows
```
Pressione as teclas Winkey + X e depois clique em Computer Management
Clique em Local Users, Groups
Dê um duplo clique em Administrators e depois clique em Add
Digite Fagner.Braga e depois clique em Check Names (SRV-SQL\Fagner.Braga)
Clique em OK
Clique em OK
```
### Adicionando usuário do Windows ao SQL
```
Copiar o arquivo adiciona-usuario-windows.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo adiciona-usuario-windows.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
### Criando usuário SQL
```
Copiar o arquivo cria-usuario-sql.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo cria-usuario-sql.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
### Obtendo dados de login de usuários do SQL 
```
Copiar o arquivo dados-login.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo dados-login.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
### Autorizações de Acesso a nível do SQL Server 
```
Copiar o arquivo autorizacoes-sql.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo autorizacoes-sql.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
```
### Autorizações a nível de banco de dados
Copiar o arquivo autorizacoes-usuarios.sql da pasta scripts para a pasta F:\Scripts
No Management Studio, pressione as teclas Ctrl + O,
Selecione o arquivo autorizacoes-usuarios.sql em F:\Scripts e clique em Open
Pressione F5 para executar o Script
