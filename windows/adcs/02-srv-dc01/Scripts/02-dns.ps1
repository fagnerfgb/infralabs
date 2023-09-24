﻿<# Configure os servidores DNS de um adaptador de rede#>
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses ("192.168.10.1")

<# Adiciona encaminhadores DNS #>
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Add-DnsServerForwarder -IPAddress 8.8.4.4 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.222.222 -PassThru
Add-DnsServerForwarder -IPAddress 208.67.220.220 -PassThru