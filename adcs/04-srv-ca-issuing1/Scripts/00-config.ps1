# Abrir o PowerShell como Administrador
<#Liste todos os adaptadores de rede disponíveis#>
Get-NetAdapter -Name *
<#Remova qualquer configuração de endereço IP do adaptador de rede.#>
Remove-NetIPAddress -InterfaceIndex 6 -Confirm:$false
<#Remova qualquer configuração DNS do adaptador de rede.#>
Remove-NetRoute -InterfaceIndex 6 -Confirm:$false
<#Configure um endereço IP estático em uma interface de rede.#>
New-NetIPAddress -InterfaceIndex 6 -IPAddress 192.168.10.3 -AddressFamily IPv4 -PrefixLength 24
<#Configure os servidores DNS de um adaptador de rede.#>
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses ("192.168.10.1")
<#Liste todos os adaptadores de rede com suporte a IPV6.#>
Get-NetAdapterBinding -ComponentID ms_tcpip6
<#Desative o IPV6 em um adaptador de rede.#>
netsh interface set interface "Ethernet" newname="Rede Interna"
Disable-NetAdapterBinding -InterfaceAlias "Rede Interna" -ComponentID ms_tcpip6
<#Habilita o Gerenciamento remoto #>
<#Enable-PSRemoting –force#>
<#Altera o fuso horário #>
Set-TimeZone -Name "E. South America Standard Time"
<#Desabilitar IE Enhanced Security Configuration para administradores #>
function Disable-IEESC {
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 1
Stop-Process -Name Explorer
Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}
Disable-IEESC
<#Desabilitar UAC #>
$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
New-ItemProperty -Path $path -Name 'ConsentPromptBehaviorAdmin' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'ConsentPromptBehaviorUser' -Value 3 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableInstallerDetection' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableLUA' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableVirtualization' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'PromptOnSecureDesktop' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'ValidateAdminCodeSignatures' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'FilterAdministratorToken' -Value 0 -PropertyType DWORD -Force | Out-Null


<#Habilitar Área de Trabalho Remota #>
Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\‘ -Name “fDenyTSConnections” -Value 0
Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\‘ -Name “UserAuthentication” -Value 1
Enable-NetFirewallRule -DisplayGroup “Remote Desktop”
<#Renomeia o computador#>
Rename-Computer -NewName srv-ca-issuing1 -Restart

