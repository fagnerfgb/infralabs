param($tipoDeExportacao)
$ErrorActionPreference = "Stop"

# Hashtable coluna nome
$nameExpr = @{n="Nome";e={$PSItem.Name}}

# Hashtable coluna Tamanho
$lengthExpr = @{n="Tamanho";e={ "{0:N2}KB" -f ($PSItem.length/1KB)}}

# Array 
$params = $nameExpr, $lengthExpr

# Código
$resultado = 
	gci -Recurse -File | 
		? Name -like "*_migrando_*" | 
		Select $params
if ($tipoDeExportacao -eq "HTML"){
$estilos = Get-Content styles.css
$styleTag = "<style> $estilos </style>"
$tituloPagina = "Relatorio de Scripts em Migracao"
$tituloBody = "<h1> $tituloPagina </h1>"

$resultado | 
	ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBody| 
	Out-File relatorio.html
} elseif ($tipoDeExportacao -eq "JSON"){
	$resultado | 
	ConvertTo-JSON |
	Out-File relatorio.json

} elseif ($tipoDeExportacao -eq "CSV"){
	$resultado | 
	ConvertTo-CSV -notypeinformation |
	Out-File relatorio.csv
}