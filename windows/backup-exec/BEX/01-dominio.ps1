$Username = 'thanos@grupo2.intra'
$Password = '123@senac'
[SecureString]$Securepassword = $Password | ConvertTo-SecureString -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $Securepassword
Add-Computer –DomainName "grupo2.intra" -OUPath "OU=SERVERS,OU=GRUPO2,DC=grupo2,DC=intra" -Credential $credential
Restart-Computer
