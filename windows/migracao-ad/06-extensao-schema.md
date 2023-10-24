#Autor: Fagner Geraldes Braga  
#Data de criação: 18/10/2023    
#Data de atualização: 18/10/2023  
#Versão: 0.01  

## Estender o Schema do AD para a versão 2022
Inserir a mídia Windows Server 2022 no DC01  
Abrir a pasta support e copiar a pasta Adprep na raiz do DC01  
Abrir o CMD como Administrator e execute os comandos:
```
cd c:\adprep
adprep /forestprep
adprep /domainprep
adprep /domainprep /gpprep
adprep /rodcprep
```
## Caso ocorra algum erro nos processos acima, faça as validações abaixo
Caso durante a execução do ADPrep o mesmo apresente falha deve-se verificar o log que é gerado na pasta C:\Windows\Debug\Adprep.  
Caso no log conste o erro:   
### "Adprep failed to verify whether schema master has completed a replication cycle after last reboot."  
Executar os passos abaixo para identificar os problemas e correções:

Verificar e corrigir as configurações de data e hora nos servidores de AD, caso os servidores de AD estejam com relógio errado pode apresentar erro ao executar o ADPREP.  

Verificar se o serviço NETLOGON está em execução em todos os servidores de AD e está como automático.  

Caso esteja apresentando problema de replicação execute o comando abaixo para identificar se o servidor está com permissão para replicação de entrada e saída.  
```
repadmin /options DC01
```
Caso a resposta do comando seja parecida com essa abaixo, indica que o servidor está com problema de entrada e saída de replicação.  
### Current DC Options: IS_GC DISABLE_INBOUND_REPL DISABLE_OUTBOUND_REPL  

Para corrigir o problema:
```
repadmin /options DC01 -disable_inbound_repl
repadmin /options DC01 -disable_outbound_repl
```
Após executar os comandos acima executar novamente: 
```
repadmin /options DC01
```
Caso a resposta seja apenas IS_GC você poderá executar o ADPREP novamente.
