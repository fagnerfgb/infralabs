#Autor: Fagner Geraldes Braga  
#Data de criação: 30/03/2023  
#Data de atualização: 30/03/2023  
#Versão: 0.01  

## Criptografia Simétrica  
	Chave simétrica ou chave de sessão
	Remetente precisa enviar chave simétrica ao destinatário 

## Criptografia Assimétrica
	Par de chaves
	Chave Privada (criptografa o dado)
	Chave Pública (descriptografa o dado)
	Destinatário precisa ter chave pública

## Comunicação HTTPS
	Host de origem cria chave simétrica para se comunicar com Webserver
	Webserver utiliza criptografia assimétrica e envia chave pública para o host
	Host utiliza a chave pública enviada pelo Webserver para criptografar e enviar informação e chave simétrica ao Webserver

## Certificado Digital
	X.509
	Emissor: Nome da CA
	Requerente: Quem solicitou o certificado (url)
	Validade
	Chave pública: HASH (criptografa informações do certificado e gera uma impressão digital)

## CA
	Possui par de chaves pública e privada
	Root (Raiz)
	Subordinada
		Intermediária
		Emissora

## Fluxo E-Commerce
	1. Host cria chave simétrica para se comunicar com Webserver
	2. Webserver envia certificado ao Host
	3. Host precisa da chave pública da CA para poder descriptografar certificado
	4. Após descriptografar certificado, host acessa a chave pública do certificado
	5. Com a chave pública, host criptografa a chave simétrica e envia ao Webserver

## CA em camadas
	Protege CA Root

### CA Root (Offline)
	Standalone
	Garantir a segurança da chave privada
	Só emite o certificado para a CA Emissora

### CA Subordinada Emissora
	CA Enterprise

### CA Entreprise
	Membro do AD
	GPO
	Auto enrollment