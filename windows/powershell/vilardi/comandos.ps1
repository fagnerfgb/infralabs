$PSVersionTable
# mostra a versão do Powershell

powershell.exe -version 2
# altera o Powershell para a versão 2

powershell.exe -version 5.1
# altera o Powershell para a versão 5.1

Get-Command -Name *service*
# busca comandos que contenha service em seu nome

Get-Service -Name AdobeARMservice
# busca serviço com um determinado nome

Get-Service -ComputerName localhost -Name AdobeARMservice
# busca serviço com um determinado nome em um determinado computador

Get-Service
Get-Process

Get-Item -Path c:\
# lista o diretório especificado

Get-ChildItem
# lista os itens filhos do diretório corrente

Get-ChildItem -Path C:\
# lista os itens filhos do diretório especificado

Get-ChildItem -Recurse
# lista os itens filhos do diretório corrente de forma recursiva

Get-Help Get-ChildItem
# mostra informações sobre utilização de determinado comando

Update-Help
# atualiza o arquivo de ajuda

Get-Help Get-ChildItem -ShowWindow
# mostra as informações em uma janela

Get-EventLog -LogName Application -EntryType Error -Newest 10
# lista dos 10 últimos logs de evento de aplicação cuja a entrada seja de erro

Get-Alias
# lista os alias para os comandos existentes no powershell

Show-Command -Name Add-Member

Start-Transcript transcript.txt
# grava em um arquivo os comandos e as saídas que aparecem na console do powershell

Get-Help *resolve*


Get-Command *resolve*

Get-Command -Verb resolve

Get-Help *adapter*

Get-Command -verb Set -noun *adapter*

Get-Help *sched*

Get-command *sched*

Get-Command -Verb Block

Get-Help *firewall*

Get-Help Get-NetFirewallRule -Full

$env:TMP
$env:TEMP
$env:HOMEPATH

Stop-Transcript
# para a gravação do transcript

Get-Module -Name ActiveDirectory -ListAvailable

Get-Command -Noun *User* -module ActiveDirectory

New-ADUser "Jane Doe" -Department IT

Get-ADUser -Filter *

Get-ADUser -Identity "Jane Doe" -Properties *

Get-Help Get-ADUser -Examples

Get-ADUser -Filter 'Name -like "*Robson*"'

Get-ADUser -filter * -SearchBase "OU=USERS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" | Format-Table Name,DistinguishedName

Get-Help Get-ADUser -ShowWindow

Get-Command -Name *ADGroup*
# mostra comandos relacionados aos grupos do AD

New-ADGroup -Name ServerAdmins -GroupScope Global -Path "OU=GROUPS,OU=GRUPO2,DC=GRUPO2,DC=INTRA"
# criar grupo global com nome ServerAdmins na OU Groups

Add-ADGroupMember "ServerAdmins" -Members "Fagner.Braga"
# adiciona usuário a determinado grupo

Get-ADUser -Filter 'name -like "*Fagner*"'

Get-ADGroupMember Suporte
# lista os membros de determinado grupo

Set-ADUser "Fagner.Braga" -StreetAddress "Rua Celia Domingues Faustino, 281" -City "Guarulhos" -State "São Paulo" -Country "BR"
# modificas algumas propriedades de um determinado usuário

Get-ADUser -Identity "Fagner.Braga" -Properties StreetAddress, City, State, Country

Get-Command -Name "*ADComputer*"

New-ADComputer -Name CL01 -Path "OU=DESKTOPS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -Enabled $true
# cria uma conta de computador em determinada OU

Get-Command -Name "*ADOrganizational*"

New-ADOrganizationalUnit -Name "Desativados" -Path "OU=GRUPO2,DC=GRUPO2,DC=INTRA" -Description "Contas desativadas"
# cria uma OU

Get-ADOrganizationalUnit -Filter *

Set-ADOrganizationalUnit -Identity "OU=Desativados,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -ProtectedFromAccidentalDeletion $true
# modifica propriedade da OU. Neste caso ativa a propriedade contra deleção de OU por acidente

Get-Help Set-ADOrganizationalUnit -examples

New-ADOrganizationalUnit -Name "CONTACTS" -Path "OU=GRUPO2,DC=GRUPO2,DC=INTRA" -ProtectedFromAccidentalDeletion $true

New-ADObject -Name FagnerBragaContact -type contact -DisplayName "Fagner Braga" -PATH "OU=CONTACTS,OU=GRUPO2,DC=GRUPO2,DC=INTRA"
# cria um objeto de contato

Get-ADObject -SearchBase "OU=CONTACTS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -Filter *
# busca pelos objetos existentes em determinado local

Get-ADObject -Filter 'ObjectClass -eq "contact"'
# busca objetos cuja classe seja contact

Get-Help Get-ADObject -Examples

Get-ADUser -Identity "Fagner.Braga" -Properties *

Set-ADObject -Identity "CN=Fagner Braga,OU=USERS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -Description "Network Administrator"
# Altera propriedade description de um determinado usuário

Get-ADUser -Identity "Fagner.Braga" -Properties Description
# mostra o valor da propriedade description de um determinado usuário

Get-ADUser -Identity "Fagner.Braga" -Properties * | Set-ADUser -Department "Information Technology"
# lista propriedades de um determinado usuário e depois altera a propriedade departament dele

Get-ADUser -Identity "Fagner.Braga" | Set-ADUser -Department "TI"
# lista propriedades de um determinado usuário e depois altera a propriedade departament dele

Get-ADGroup "ServerAdmins" | Rename-ADObject -NewName "NetworkAdmins"
# lista um determinado grupo e depois o renomeia

Get-ADGroup -Identity "ServerAdmins" | Set-ADGroup -SamAccountName "NetworkAdmins"
# altera o SamAccountName do grupo

Get-Command -name "*gp*"

New-GPO -Name "TESTE"
# cria gpo

Get-GPO -name TESTE
# obtém uma determinada GPO

New-GPLink -name TESTE -Target "OU=Desativados,OU=GRUPO2,DC=GRUPO2,DC=INTRA"
# cria link de uma gpo em uma determinada OU

Remove-GPLink -name TESTE -Target "OU=Desativados,OU=GRUPO2,DC=GRUPO2,DC=INTRA"
# remove link de uma gpo em uma determinada OU

Remove-GPO -Name "TESTE"
# apaga GPO

Get-GPO -All
# lista todas as GPOs

Get-Command -name "*WindowsFeature*"

Get-WindowsFeature Telnet-Client | Install-WindowsFeature
# lista uma determinada feature e depois a instala

Uninstall-WindowsFeature Telnet-Client
# desinstala uma determinada feature

Get-Service | Get-Member
# lista todas as propriedades de um determinado objeto

Get-Service WinRM | Select-Object DisplayName, Status, StartType, MachineName

Get-Process | Format-List
# lista os processos e os exibe em formato de lista

Get-Process | Format-Table
# lista os processos e os exibe em formato de table

Get-Process | Format-Wide
# lista os processos e os exibe em formato de colunas

Get-ADObject -Filter * | Format-Table -Property Name, ObjectClass, Description -Wrap

Get-GPO -all | Format-Wide -Property DisplayName -Column 1

Get-GPO -all | Format-Table -Property DisplayName

Get-Service | Sort-Object -Property Name
# lista os objetos por nome em ordem alfabética

Get-Service | Sort-Object -Property Name -Descending
# lista os objetos por nome em ordem alfabética inversa

Get-Service | Sort-Object -Property Status
# lista os objetos pelo Status

Get-Service | Sort-Object -Property Status, Name
# lista os objetos pelo Status e pelo name

Get-Service | Sort-Object -Property Status, Name | Format-Table -GroupBy Status
# lista os objetos pelo Status e pelo name agrupados pelo Status

Get-Service | Measure-Object
# lista quantidade de serviços existentes

Get-ADUser -Filter * | Measure-Object
# lista quantidade de usuários existentes

Get-ADObject -Filter * | Measure-Object
# lista quantidade de objetos existentes

