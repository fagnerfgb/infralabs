# Usuários que possuem conta ativa e não logam por um período determinado
$data = 90
$estilos = Get-Content styles.css
$styleTag = "<style> $estilos </style>"
$tituloPagina = "Usuários que não logam há $data dias"
$tituloBody = "<h1> $tituloPagina </h1>"
$logonDate = [DateTime]::Today.AddDays(-$data)
Get-ADUser  -filter { lastLogon -le $logonDate  } -Properties * | Where-Object {$_.enabled -eq $true} | sort Office, Name | Select-Object  @{n="Nome";e={$_.name}},@{n="Usuário";e={$_.SamAccountName}},@{n="Departamento";e={$_.Office}} | 
ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody| 
Out-File nao-loga.html

# Localiza todos os usuários que possuem o atributo extensionAttribute1 com o valor Externo
# Libera e-mail para acesso externo
$estilos = Get-Content styles.css
$styleTag = "<style> $estilos </style>"
$tituloPagina = "Usuários com acesso externo ao e-mail"
$tituloBody = "<h1> $tituloPagina </h1>"
Get-ADUser  -filter "Enabled -eq 'True' -and ExtensionAttribute1 -like 'Externo'" -Properties * | sort Office, Name | Select-Object  @{n="Nome";e={$_.name}},@{n="Usuário";e={$_.SamAccountName}},@{n="Departamento";e={$_.Office}} |
ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody| 
Out-File externo.html

# Localiza todos os usuários que possuem o atributo extensionAttribute1 com o valor Externo
# Libera e-mail para acesso externo
Get-ADUser -filter "Enabled -eq 'True' -and ExtensionAttribute1 -like 'Externo'" -Properties * | sort Office, Name | Select-Object  name, SamAccountName, Office  |
Export-Csv -path externo.csv
 