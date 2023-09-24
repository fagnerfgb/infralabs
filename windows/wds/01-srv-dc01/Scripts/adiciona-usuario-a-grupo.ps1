Import-Module activedirectory
Import-CSV C:\Scripts\03-groups\professores.csv -Header SamAccountName | ForEach-Object {Add-AdGroupMember -Identity "Professores" -members $_.SamAccountName}
Import-CSV C:\Scripts\03-groups\coordenadores.csv -Header SamAccountName | ForEach-Object {Add-AdGroupMember -Identity "Coordenadores" -members $_.SamAccountName}
Import-CSV C:\Scripts\03-groups\suporte.csv -Header SamAccountName | ForEach-Object {Add-AdGroupMember -Identity "Suporte" -members $_.SamAccountName}
Import-CSV C:\Scripts\03-groups\diretoria.csv -Header SamAccountName | ForEach-Object {Add-AdGroupMember -Identity "Diretoria" -members $_.SamAccountName}
Import-CSV C:\Scripts\03-groups\alunos.csv -Header SamAccountName | ForEach-Object {Add-AdGroupMember -Identity "Alunos" -members $_.SamAccountName}
Add-AdGroupMember -Identity "Pedagogico" -members Professores, Coordenadores