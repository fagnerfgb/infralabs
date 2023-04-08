#Autor: Fagner Geraldes Braga  
#Data de criação: 08/04/2023    
#Data de atualização: 08/04/2023  
#Versão: 0.01  

# Documentação do Curso de Active Directory Certification Services

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

## Tópicos
	Conceitos de Infraestrutura de chave pública
	Certificados digitais
	Instalação e configuração do ADCS
	Emissão de certificados
	Segurança
	Auditoria da Infraestrutura PKI

## Ambiente
	Domínio: grupo2.intra
	Rede: 192.168.10.0

	VM 1 
	SRV-DC01 (Domain Controller) 
	192.168.10.1/24  

	VM 2: SRV-CA-ROOT01 (Autônomo)
	192.168.10.2/24  

	VM 3: SRV-CA-ISSUING1 (Membro do domínio)
	192.168.10.3/24     

	VM 4: CL01 (Windows 10)
	192.168.10.4/24