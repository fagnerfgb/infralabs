<# Instala e Configura o DHCP #>
Install-WindowsFeature -Name 'DHCP' –IncludeManagementTools
Add-DhcpServerV4Scope -Name "GRUPO2" -Description "Rede Corporativa da GRUPO2" -StartRange 172.16.2.100 -EndRange 172.16.2.200 -SubnetMask 255.255.255.0
Set-DhcpServerV4OptionValue -DnsServer 172.16.2.10
Set-DhcpServerv4Scope -ScopeId 172.16.2.0 -LeaseDuration 0.08:00:00
Add-Dhcpserverv4ExclusionRange -ScopeId 172.16.2.0 -StartRange 172.16.2.130 -EndRange 172.16.2.136
Add-DhcpServerInDC -DnsName "srvgrupo2.grupo2.intra" -IPAddress 172.16.2.10
Restart-service dhcpserver
Get-DhcpServerInDC
Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2