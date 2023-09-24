<# Configure os servidores DNS de um adaptador de rede#>
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses ("192.168.56.11")

<# Adiciona encaminhadores DNS #>
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Add-DnsServerForwarder -IPAddress 8.8.4.4 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.222.222 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.220.220 -PassThru

<# Cria Zona Reversa #>
Get-DnsServerZone
Add-DnsServerPrimaryZone -NetworkID "192.168.56.0/24" -ReplicationScope "Domain"
Get-DnsServerZone

Add-DnsServerResourceRecordPtr -Name "192.168.56.11" -ZoneName "56.168.192.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "dc01.grupo2.intra"

<# Adiciona registro no Servidor DNS para o SRV-Ubuntu #>
Add-DnsServerResourceRecordA -Name "srv-ubuntu" -ZoneName "grupo2.intra" -AllowUpdateAny -IPv4Address "192.168.56.10" -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -Name "srv-rockylinux" -ZoneName "grupo2.intra" -AllowUpdateAny -IPv4Address "192.168.56.13" -TimeToLive 01:00:00
