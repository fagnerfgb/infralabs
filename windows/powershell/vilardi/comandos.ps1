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

Get-Process | Sort-Object -Property ProcessName | Select-Object -First 10
# lista os objetos organizando pelo ProcessName e depois exibe os primeiros 10 processos

Get-Process | Sort-Object -Property ProcessName | Select-Object -Last 10
# lista os objetos organizando pelo ProcessName e depois exibe os últimos 10 processos

Get-Process | Sort-Object -Property ProcessName | Select-Object -First 10 -Skip 1
# lista os objetos organizando pelo ProcessName e depois exibe os primeiros 10 processos e pula o primeiro

Get-ADUser -Filter * | Sort-Object -Property Name | Format-Table Name

Get-ADUser -Filter * -Properties Title | Sort-Object -Property Title, Name | Format-Table Title, Name

Get-Process | Sort-Object -Property CPU -Descending |Select-Object -Property Name, CPU -First 10 | Format-Table 

$varDns = Get-Process dns

Write-Output $varDns

$varDns.Name
$varDNS.VM
$varDNS.CPU

$varUser = Get-ADUser -Filter * -Properties *| Where-Object {$PSItem.Name -eq "Fagner Braga"}
$varUser.City
$varUser.Title
$varUser.Country

Get-Process | Select-Object Name, Id, @{n="Memória Virtual";e={$PSItem.VM}} -First 10

Get-Date | Get-Member

$data = Get-Date
$data.day
$data.DayOfWeek
$data.DayOfYear
$data.Ticks
$data.TimeOfDay


Get-HotFix | Get-Member

$kbs = Get-HotFix
$kbs.hotfixID

Get-Service | Where-Object Status -eq Running

Get-EventLog -LogName Application -Newest 100 | Where-Object {$PSItem.EntryType -eq "Error" -and $PSItem.EventID -eq 8193}

Get-Process | Where-Object {$PSItem.CPU -gt 10}

Get-Process | Where-Object {$PSItem.Responding -eq $true -or $PSItem.Responding -eq "Starting"}

Get-Process | Where-Object {-not $PSItem.Responding}

(Get-Service | Where-Object {$PSItem.name -eq "WinRM"} | Format-Table Name).length

Get-Service | Where-Object {$PSItem.Name.Length -lt 5} | Format-Table Name

Get-Date | Get-Member

Get-Help Get-Service -ShowWindow

Get-ADComputer -Filter * | Select-Object @{n="ComputerName";e={$PSItem.name}} | Get-Process

Get-PSProvider

Get-PSDrive

Get-Command -Noun *item* -Module Microsoft.PowerShell.Management

Set-Location env:

Get-ChildItem

$env:OS

$env:COMPUTERNAME

$env:LOCALAPPDATA

Get-PSProvider

Set-Location HKLM:

Get-ChildItem software\Microsoft\windows\currentversion

Get-ItemProperty software\Microsoft\windows\currentversion\Run -Name SecurityHealth

$regRun = Get-ItemProperty software\Microsoft\windows\currentversion\Run -Name SecurityHealth

$regRun

Get-PSProvider

Set-Location Alias:

Get-ChildItem

Get-PSProvider

Import-Module ActiveDirectory

Set-Location AD:

Get-ChildItem

Get-Command -Noun *item* -Module Microsoft.PowerShell.Management

Get-Help New-Item -ShowWindow

New-Item -Path \\grupo2.intra\SYSVOL\grupo2.intra\scripts -Name Teste -ItemType Directory

Get-PSDrive

New-PSDrive -name Teste -Root \\grupo2.intra\SYSVOL\grupo2.intra\scripts\Teste -PSProvider FileSystem

Get-PSDrive

Set-Location Teste:

New-Item script.txt

Get-ChildItem

Get-ChildItem -Path HKCU:\Software

New-Item -Path HKCU:\Software -Name Scripts

Set-Location HKCU:\Software\Scripts

New-ItemProperty -Path HKCU:\Software\Scripts -name "PSDriveName" -Value "ScriptShare"

Get-ItemProperty .

Get-PSProvider

Set-Location C:

Set-Location AD:

New-PSDrive -Name USERS -Root "OU=USERS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -PSProvider ActiveDirectory

Get-PSDrive

Set-Location USERS:

Get-ChildItem

New-PSDrive -Name GROUPS -Root "OU=GROUPS,OU=GRUPO2,DC=GRUPO2,DC=INTRA" -PSProvider ActiveDirectory

Set-Location GROUPS:

Get-ChildItem

New-Item -Name "CN=Inspetores" -ItemType Group -Path .

Get-WmiObject -Namespace root -list | Sort-Object Name

Get-WmiObject -Namespace root -List -Recurse | Select-Object -Unique __NAMESPACE | Sort-Object Name

Get-WmiObject -Namespace root\CIMv2 -List | Sort-Object Name

Get-WmiObject -Namespace root\CIMv2 -List | Where-Object name -like "*LogicalDisk*" | Sort-Object Name

Get-CimInstance -ClassName Win32_LogicalDisk

Get-Help Get-WmiObject -ShowWindow

Get-WmiObject -Class Win32_Process | Format-Table

Get-WmiObject -Class Win32_Service | Where-Object State -eq "Stopped" | Format-Table

Get-WmiObject -Namespace root\CIMv2 -list | Where-Object name -like "*bios*" | Sort-Object Name

Get-CimInstance -ClassName Win32_BIOS

Get-WmiObject -Namespace root\CIMv2 -list | Where-Object name -like "*power*" | Sort-Object Name

Get-WmiObject -Namespace root\CIMv2 -list | Where-Object name -like "*operating*"

Get-WmiObject -Class Win32_OperatingSystem | Get-Member

Get-WmiObject -Class Win32_OperatingSystem | Select-Object version,buildnumber,serialnumber

Get-WmiObject -Namespace root\cimv2 -list | Where-Object Name -like "*system*" | Sort-Object Name

Get-WmiObject -Class Win32_ComputerSystem | Format-List -Property *

Get-WmiObject -Class Win32_ComputerSystem | Select-Object Manufacturer,Model,@{n="RAM";e={$PSItem.TotalPhysicalMemory}}

Get-WmiObject -Namespace root\CIMv2 -list | Where-Object Name -like "*service*" | Sort-Object Name

Get-WmiObject -Class Win32_Service | Select-Object DisplayName | Format-Table

Get-WmiObject -Namespace root\cimv2 -list | where name -like "*user*" | Sort-Object Name

Get-CimInstance -ClassName Win32_UserAccount | Get-Member

Get-CimInstance -ClassName Win32_UserAccount | Select-Object Name, PasswordExpires

Get-CimInstance -ClassName Win32_UserAccount | Format-Table -Property Name,SID

Get-CimInstance -ClassName Win32_BIOS | Get-Member

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration

Invoke-CimMethod -ClassName Win32_OperatingSystem -ComputerName SRV-DC01 reboot

Get-ChildItem variable:

$PWD

$PID

$PSHOME

Get-Variable

$num1 = 10

$num1

$logFile = "c:\temp\log.txt"

$logFile

$user = Get-ADUser Thanos -Properties *

$user.DistinguishedName
$user.name
$user.SID

$service = Get-Service W32Time
$service
$service.Status
$service.Name

Write-Host "Teste"

Write-Host "O caminho do arquivo de log é $logFile"

$num1
$num1 = $null
$num1

$num1 = 5
$num2 = 7
$sum = $num1 + $num2
$sum

$caminho = 'C:\temp\'
$arquivo = 'log.txt'
$caminhoCompleto = $caminho + $arquivo
$caminhoCompleto

[int]$num3 = "5"

$num3.GetType()

$num4 = "5"
$num4.GetType()

[datetime]$date = "November 21, 2023"
$date
$date.GetType()

$num1 = 5
$num1

$logFile.GetType()
$service.GetType()

























