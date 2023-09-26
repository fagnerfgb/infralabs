#Autor: Fagner Geraldes Braga  
#Data de criação: 12/03/2023  
#Data de atualização: 25/09/2023  
#Versão: 0.01  

# Tipos de Backup

## Completo
```
Cópia de todos os dados para outro local;
Vantagem: reprodução fiel e completa de todas as informações;
Demanda maior espaço de armazenamento e demora mais para ser completado.
```
## Diferencial

```
Os dados copiados são os alterados em relação ao último Backup Completo;
Armazena mais dados que o backup incremental;
Requer mais espaço de armazenamento que o incremental;
A restauração é mais rápida que o incremental, necessitando do último backup completo e do último backup incremental.
```
## Incremental
```
Os dados copiados são os alterados em relação ao último Backup Completo;
Armazena menos dados que o backup diferencial;
O backup é realizado de forma mais rápida que o backup diferencial;
A restauração é mais lenta que o backup diferencial, pois necessita do último backup completo e de todas os outros backups até o ponto de restauração desejado;
Mais suscetível a erros.
```
## Incremental contínuo
```
Possui automatização do processo de recuperação de dados.
Semelhante ao backup completo
```
# RPO e RTO

## RPO
```
Objetivo de ponto de recuperação
Tolerância à perda da sua empresa: a quantidade de dados que pode ser perdida antes que ocorram danos significativos aos negócios.
```
## RTO
```
Objetivo de tempo de recuperação
Quanto tempo um aplicativo pode ficar inativo sem causar danos significativos ao negócio
Missão: categorizar os aplicativos por prioridade e perda potencial de negócios
```

