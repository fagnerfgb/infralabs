; SCRIPT AUTOMATIZADO PARA CRIACAO DE USUARIOS NO ACTIVE DIRECTORY
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (dir_e.csv) DO DSADD USER "CN=%%J %%I, OU=Executiva, OU=Diretoria, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Diretoria_Executiva -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (dir_t.csv) DO DSADD USER "CN=%%J %%I, OU=Tecnica, OU=Diretoria, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Diretoria_Tecnica -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (ctb.csv) DO DSADD USER "CN=%%J %%I, OU=Contabilidade, OU=Financeiro, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Contabilidade -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (cp.csv) DO DSADD USER "CN=%%J %%I, OU=Contas_a_Pagar, OU=Financeiro, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Contas_a_Pagar -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (cr.csv) DO DSADD USER "CN=%%J %%I, OU=Contas_a_Receber, OU=Financeiro, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Contas_a_Receber -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (ctr.csv) DO DSADD USER "CN=%%J %%I, OU=Controladoria, OU=Financeiro, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Controladoria -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (fis.csv) DO DSADD USER "CN=%%J %%I, OU=Fiscal, OU=Financeiro, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Fiscal -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (jur.csv) DO DSADD USER "CN=%%J %%I, OU=Juridico, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Juridico -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (man.csv) DO DSADD USER "CN=%%J %%I, OU=Manutencao, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Manutencao -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (mar.csv) DO DSADD USER "CN=%%J %%I, OU=Marketing, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Marketing -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (ben.csv) DO DSADD USER "CN=%%J %%I, OU=Beneficios, OU=RH, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept RH -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (fp.csv) DO DSADD USER "CN=%%J %%I, OU=Folha_de_Pagamento, OU=RH, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept RH -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (rs.csv) DO DSADD USER "CN=%%J %%I, OU=Recrutamento_e_Selecao, OU=RH, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept RH -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (dev.csv) DO DSADD USER "CN=%%J %%I, OU=Desenvolvimento, OU=Tecnologia, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Tecnologia -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (infra.csv) DO DSADD USER "CN=%%J %%I, OU=Infra-Estrutura, OU=Tecnologia, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Tecnologia -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (sup.csv) DO DSADD USER "CN=%%J %%I, OU=Suporte, OU=Tecnologia, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Tecnologia -Company FGB -PWD Welcome1 -DISABLED YES
FOR /F "EOL=; TOKENS=1,2,3,* DELIMS=;" %%I IN (ven.csv) DO DSADD USER "CN=%%J %%I, OU=Vendas, OU=USERS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -SAMID "%%J.%%I" -UPN "%%J.%%I"@FGB.LOCAL -FN %%J -LN %%I -DISPLAY "%%J %%I" -EMAIL "%%J.%%I"@FGB.com.br -title %%K -Dept Vendas -Company FGB -PWD Welcome1 -DISABLED YES







