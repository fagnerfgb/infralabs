$todoOsitens = gci -Recurse
$todoOsitens.Length
$todosOsArquivos = gci -Recurse -File
$todosOsArquivos.Length

gci -Recurse -File | Select-Object Name | Where-Object { $_ -like "*_migrando_*"} 

gci -Recurse -File | Where-Object Name -like "*_migrando_*" | Select-Object Name, {"{0:N2}KB" -f ($_.Length / 1KB) }


$nameExpr = "Nome", {$_.Name}
$lengthExpr = "Tamanho", {"{0:N2}KB" -f ($_.Length / 1KB) }
$params = $nameExpr, $lengthExpr
gci -Recurse -File | 
    ? Name -like "*_migrando_*" | 
    select $params
        
