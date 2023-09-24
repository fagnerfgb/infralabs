<# Configure os servidores DNS de um adaptador de rede#>
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses ("192.168.10.1")

<# Adiciona encaminhadores DNS #>
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Add-DnsServerForwarder -IPAddress 8.8.4.4 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.222.222 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.220.220 -PassThru

# Configura uma Zona Reversa
Get-DnsServerZone
Add-DnsServerPrimaryZone -NetworkID "192.168.10.0/24" -ReplicationScope "Domain"

# Cria registro PTR de SRV-DC01
Get-DnsServerZone
Add-DnsServerResourceRecordPtr -Name "1" -ZoneName 10.168.192.in-addr.arpa -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "srv-dc01.grupo2.intra"
