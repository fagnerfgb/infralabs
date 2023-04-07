#Autor: Fagner Geraldes Braga  
#Data de criação: 30/03/2023  
#Data de atualização: 07/04/2023  
#Versão: 0.02  

## Criptografia Simétrica  
	Chave simétrica ou chave de sessão
	Remetente precisa enviar chave simétrica ao destinatário 

## Criptografia Assimétrica
	Par de chaves
	Chave Privada 
	Chave Pública
	Destinatário precisa ter chave pública

## Comunicação HTTPS
	1. Host envia dado criptografado com chave simétrica para Webserver
	2. Webserver utiliza criptografia assimétrica e envia chave pública para o host
	3. Host utiliza a chave pública enviada pelo Webserver para criptografar e enviar chave simétrica ao Webserver
	4. Webserver descriptografa a chave simétrica do host usando a sua chave privada e desta forma tem acesso a chave simétrica do host para poder ler o dado enviado pelo host no passo 1

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
	1. Host envia dado criptografado com chave simétrica para Webserver
	2. Webserver envia certificado ao Host
	3. Host precisa da chave pública da CA para poder descriptografar certificado
	4. Após descriptografar certificado, host acessa a chave pública do certificado
	5. Com a chave pública, host criptografa a chave simétrica e envia ao Webserver
	6. Webserver descriptografa a chave simétrica do host usando a sua chave privada e desta forma tem acesso a chave simétrica do host para poder ler o dado enviado pelo host no passo 1

## CA em camadas
	Protege CA Root

### CA em 2 Camadas
	CA Root (Standalone)
	CA Subordinada Emissora (Enterprise)

### CA em 3 Camadas
	CA Root (Standalone)
	CA Subordinada Intermediária (Standalone)
	CA Subordinada Emissora (Enterprise)

### CA Root (Offline)
	Garantir a segurança da chave privada
	Só emite o certificado para a CA Subordinada

### CA Entreprise
	Membro do AD
	GPO
	Auto enrollment