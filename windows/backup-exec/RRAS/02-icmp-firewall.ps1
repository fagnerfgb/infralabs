<# Habilitar ICMP v4 no Firewall #>
netsh advfirewall firewall add rule name="ICMP Allow Ping V4" protocol="icmpv4:8,any" dir=in action=allow