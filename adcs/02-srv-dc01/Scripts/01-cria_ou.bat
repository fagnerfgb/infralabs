:: CRIA OU PRINCIPAL
dsadd ou "OU=GRUPO2, DC=grupo2, DC=intra" -desc "GRUPO2"
:: CRIA SUB-OU
FOR /F "EOL=; TOKENS=1,* DELIMS=," %%I IN (02-SUB-OUs.TXT) DO dsadd ou "OU=%%I, OU=grupo2,DC=grupo2, DC=intra"