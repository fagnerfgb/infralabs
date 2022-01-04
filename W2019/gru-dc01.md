#Autor: Fagner Geraldes Braga  
#Data de criação: 02/01/2022  
#Data de atualização: 02/01/2022  
#Versão: 0.01  
***
GRU-DC01  
IP: 192.168.100.1  
Máscara: 255.255.255.0  
Gateway: 192.168.100.254  
DNS1: 192.168.100.1  
***
Adicionar Função de Serviço de Domínio do Active Directory  
Promover este servidor a um controlador de domínio  
Adicionar uma nova floresta: FGB.LOCAL  
Nível Funcional da Floresta: Windows Server 2016  
Nível Funcional do Domínio:  Windows Server 2016  
Servidor DNS  
Catálogo Global  
Senha Modo de Restauração dos Serviços de Diretório: Xtr3m3!  
Nome NetBIOS: FGB  
***
Configurando o ADDS  
ncpa.cpl  
DNS1: 192.168.100.1  
***
DNS  
Zona de Pesquisa Inversa  
    Zona primária  
    Armazenar a zona no AD  
Para todos os servidores DNS sendo executados em controladores de domínio neste domínio: FGB.LOCAL  
Zona de Pesquisa Inversa IPv4  
192.168.100  
Permitir apenas atualizações dinâmicas seguras  
***
Zona de Pesquisa Inversa  
    Zona primária  
    Armazenar a zona no AD  
Para todos os servidores DNS sendo executados em controladores de domínio neste domínio: FGB.LOCAL  
Zona de Pesquisa Inversa IPv4  
192.168.200  
Permitir apenas atualizações dinâmicas seguras  
***
Zona de Pesquisa Direta  
FGB.LOCAL  
    gru-dc01  
        Atualizar o registro de ponteiro   associado (PTR)  
***
Encaminhadores DNS  
8.8.8.8  
8.8.4.4  
1.1.1.1  
1.0.0.1  
***
Serviços e Sites do Active Directory  
Renomear Default-First-Site-Name para GRU  
***
Criar Novo Site - OSC  
***
Criar Subnets  
192.168.100.0/24 - GRU  
192.168.200.0/24 - OSC  
***
Copiar e Executar script 01-CRIA_OU.BAT
***
Copiar e Executar script CRIA_USUARIOS.BAT
***
Copiar e Executar script CRIA_GRUPOS_AD.cmd
***
