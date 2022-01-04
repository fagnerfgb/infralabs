#Autor: Fagner Geraldes Braga  
#Data de criação: 04/01/2022  
#Data de atualização: 04/01/2022  
#Versão: 0.01  
***
## GPO
***
## Nomenclatura
GPO + LOCALIDADE + ALVO + FUNÇÃO
***
## Exemplos
GPO-GRU-USER-PAPEL-DE-PAREDE  
GPO-OSC-USER-PAPEL-DE-PAREDE  
GPO-GLO-USER-PAPEL-DE-PAREDE  
GPO-GRU-COMP-DESATIVA-FIREWALL  
GPO-OSC-COMP-DESATIVA-FIREWALL  
GPO-GLO-COMP-DESATIVA-FIREWALL
***
## Política de Senhas  
Default Domain Policy  
Configuração do Computador/Políticas/Configurações do Windows/Configurações de Segurança/Políticas de conta/Políticas de senha  
A senha deve satisfazer a requisitos de complexidade: Habilitada  
Aplicar histórico de senhas: 24 senhas memorizadas  
Armazenar senhas usando criptografia reversível: Desabilitada  
Auditoria de comprimento mínimo de senha: Não definida  
Comprimento mínimo da senha: 7 Caracteres  
Tempo de vida máximo da senha: 60 Dias  
Tempo de vida mínimo da senha: 1 Dias  
***
## Tentativas de Login
Default Domain Policy  
Configuração do Computador/Políticas/Configurações do Windows/Configurações de Segurança/Políticas de conta/Políticas de bloqueio de conta  
Duração do bloqueio de conta: 30 minutos  
Limite de bloqueio de conta: 5 tentativas de logon inválidas  
Zerar contador de bloqueios de conta após: 30 minutos   
***
## Bloquear Painel de Controle
GPO-GRU-USER-BLOQUEIO-DO-PAINEL-DE-CONTROLE
Configuração do Usuário/Políticas/Modelos Administrativos/Painel de Controle  
Proibir acesso ao Painel de Controle e às configurações do PC: Ativada 
***
## Itens específicos no Painel de Controle
GPO-GRU-USER-MOSTRAR-ITENS-ESPECÍFICOS-NO-PAINEL-DE-CONTROLE
Configuração do Usuário/Políticas/Modelos Administrativos/Painel de Controle  
Mostrar apenas itens do Painel de Controle especificados: Ativada  
Lista de itens do Painel de Controle permitidos   
Microsoft.ProgramsAndFeatures 

