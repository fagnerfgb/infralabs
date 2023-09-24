# Configuração de Site
# Get-AdReplicationSite
Get-ADObject -SearchBase (Get-ADRootDSE).ConfigurationNamingContext -filter "objectclass -eq 'site'" | Rename-ADObject -NewName GRUPO2
New-ADReplicationSubnet -Name "192.168.10.0/24" -Site GRUPO2