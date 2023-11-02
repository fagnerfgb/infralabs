# Abrir o PowerShell como Administrador
<#Liste todos os adaptadores de rede disponíveis#>
Get-NetAdapter -Name *
<#Remova qualquer configuração de endereço IP do adaptador de rede.#>
Remove-NetIPAddress -InterfaceIndex 5 -Confirm:$false
<#Remova qualquer configuração DNS do adaptador de rede.#>
Remove-NetRoute -InterfaceIndex 5 -Confirm:$false
<#Configure um endereço IP estático em uma interface de rede.#>
New-NetIPAddress -InterfaceIndex 5 -IPAddress 192.168.10.5 -AddressFamily IPv4 -PrefixLength 24
<#Configure os servidores DNS de um adaptador de rede.#>
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses ("192.168.10.1")
<#Liste todos os adaptadores de rede com suporte a IPV6.#>
Get-NetAdapterBinding -ComponentID ms_tcpip6
<#Desative o IPV6 em um adaptador de rede.#>
netsh interface set interface "Ethernet 2" newname="Rede Interna"
Disable-NetAdapterBinding -InterfaceAlias "Rede Interna" -ComponentID ms_tcpip6
<#Altera o fuso horário #>
Set-TimeZone -Name "E. South America Standard Time"

<#Renomeia usuário Administrador #>
Rename-LocalUser -Name "administrator" -NewName "Thanos"

<#Renomeia o computador#>
Rename-Computer -NewName cl02 -Restart

