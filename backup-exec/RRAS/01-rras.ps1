Install-WindowsFeature Routing -IncludeManagementTools

Install-RemoteAccess -VpnType Vpn
$ExternalInterface="Internet"
$InternalInterface="Interna"

cmd.exe /c "netsh routing ip nat install"
cmd.exe /c "netsh routing ip nat add interface $ExternalInterface"
cmd.exe /c "netsh routing ip nat set interface $ExternalInterface mode=full"
cmd.exe /c "netsh routing ip nat add interface $InternalInterface"