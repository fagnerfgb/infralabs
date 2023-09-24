:: CRIA GRUPOS BASEADO EM ARQUIVO
FOR /F "EOL=; TOKENS=1,2,* DELIMS=," %%I IN (GRU.TXT) DO dsadd group "CN=%%I,OU=GROUPS,OU=GRU,OU=FGB,DC=FGB,DC=LOCAL" -samid %%I -secgrp yes -scope g
FOR /F "EOL=; TOKENS=1,2,* DELIMS=," %%I IN (OSC.TXT) DO dsadd group "CN=%%I,OU=GROUPS,OU=OSC,OU=FGB,DC=FGB,DC=LOCAL" -samid %%I -secgrp yes -scope g
