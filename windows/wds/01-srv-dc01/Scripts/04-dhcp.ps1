<# Instala e Configura o DHCP #>
Install-WindowsFeature -Name 'DHCP' –IncludeManagementTools
Add-DhcpServerV4Scope -Name "GRUPO2" -Description "Rede Corporativa da GRUPO2" -StartRange 192.168.10.100 -EndRange 192.168.10.150 -SubnetMask 255.255.255.0
Set-DhcpServerV4OptionValue -DnsServer 192.168.10.1
Set-DhcpServerv4Scope -ScopeId 192.168.10.0 -LeaseDuration 0.08:00:00
Add-DhcpServerInDC -DnsName "srv-dc01.grupo2.intra" -IPAddress 192.168.10.1
Set-DhcpServerv4OptionValue -ComputerName SRV-DC01 -ScopeId 192.168.10.0 -OptionId 066 -Value "192.168.10.1"
Restart-service dhcpserver
Get-DhcpServerInDC
Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2