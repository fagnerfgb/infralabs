:: CRIA OU PRINCIPAL
dsadd ou "OU=FGB, DC=FGB, DC=LOCAL" -desc "FGB"
:: CRIA SUB-OU
dsadd ou "OU=GRU, OU=FGB,DC=FGB, DC=LOCAL" -desc "GUARULHOS"
dsadd ou "OU=OSC, OU=FGB,DC=FGB, DC=LOCAL" -desc "OSASCO"
:: CRIA SUB-OU
FOR /F "EOL=; TOKENS=1,2* DELIMS=," %%I IN (02-SUB-OUs.TXT) DO dsadd ou "OU=%%J, OU=%%I, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (deptos.TXT) DO dsadd ou "OU=%%I, OU=USERS, OU=GRU, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (deptos.TXT) DO dsadd ou "OU=%%I, OU=USERS, OU=OSC, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (Diretoria.TXT) DO dsadd ou "OU=%%I, OU=Diretoria, OU=USERS, OU=GRU, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (Diretoria.TXT) DO dsadd ou "OU=%%I, OU=Diretoria, OU=USERS, OU=OSC, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (dti.TXT) DO dsadd ou "OU=%%I, OU=Tecnologia, OU=USERS, OU=GRU, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (dti.TXT) DO dsadd ou "OU=%%I, OU=Tecnologia, OU=USERS, OU=OSC, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (financeiro.TXT) DO dsadd ou "OU=%%I, OU=Financeiro, OU=USERS, OU=GRU, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (financeiro.TXT) DO dsadd ou "OU=%%I, OU=Financeiro, OU=USERS, OU=OSC, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (rh.TXT) DO dsadd ou "OU=%%I, OU=RH, OU=USERS, OU=GRU, OU=FGB,DC=FGB, DC=LOCAL"
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (rh.TXT) DO dsadd ou "OU=%%I, OU=RH, OU=USERS, OU=OSC, OU=FGB,DC=FGB, DC=LOCAL"








