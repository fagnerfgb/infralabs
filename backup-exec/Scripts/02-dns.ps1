<#Configure os servidores DNS de um adaptador de rede.#>
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses ("192.168.56.11")

<# Adiciona registro no Servidor DNS para o SRV-Ubuntu #>
Add-DnsServerResourceRecordA -Name "srv-ubuntu" -ZoneName "grupo2.intra" -AllowUpdateAny -IPv4Address "192.168.56.10" -TimeToLive 01:00:00