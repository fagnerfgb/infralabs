#Autor: Fagner Geraldes Braga  
#Data de criação: 01/04/2023    
#Data de atualização: 03/04/2023  
#Versão: 0.02  

## Ambiente
	Domínio: grupo2.intra
	Rede: 192.168.10.0

	VM 1 
	SRV-DC01 (Domain Controller) 
	192.168.10.1/24  

	VM 2: SRV-CA-ROOT01 (Autônomo)
	192.168.10.2/24  

	VM 3: SRV-CA-ISSUING1 (Membro do domínio)
	192.168.10.3 /24     

## Tipos de certificados
### Usuários
	E-mail
	Usuário
	EFS
	Smart Card
### Computador
	Servidor Web - HTTPS
	IPSEC
	Exchange
	System Center

## Emissão
### Manual 
	MMC
	Web
### Automática
	GPO

## Templates
	EFS
	Web
	IPSEC