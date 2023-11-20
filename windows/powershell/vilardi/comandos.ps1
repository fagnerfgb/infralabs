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

Get-Help *resolve*

Get-Command *resolve*

Get-Command -Verb resolve

Get-Help *adapter*

Get-Command -verb Set -noun *adapter*

Get-Help *sched*

get-command *sched*

Get-Command -Verb Block

Get-Help *firewall*

Get-Help Get-NetFirewallRule -Full

$env:TMP
$env:TEMP
$env:HOMEPATH

Stop-Transcript

Get-Module -Name ActiveDirectory -ListAvailable

Get-Command -Noun *User* -module ActiveDirectory

New-ADUser "Jane Doe" -Department IT

Get-ADUser -Filter *

Get-ADUser -Identity "Jane Doe" -Properties *

Get-Help Get-ADUser -Examples

Get-ADUser -Filter 'Name -like "*Robson*"'

Get-ADUser -filter * -SearchBase "OU=USERS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" | Format-Table Name,DistinguishedName

Get-Help Get-ADUser -ShowWindow

