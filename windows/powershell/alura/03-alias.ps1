Get-Alias
Set-Location 
Get-ChildItem

Get-Command -verb *rename*
Update-Help
Get-Help Rename-Item
Rename-Item sha1.bat sha1_migrando_fagner.bat -WhatIf

Get-Command -noun Alias
Get-Help New-Alias
get-help New-Alias -examples
New-Alias -Name "rename" Rename-Item
Get-Alias -name "rename"
rename sha1.bat sha1_migrando_fagner.bat
rename sha256.bat sha256_migrando_fagner.bat
rename sha384.bat sha384_migrando_fagner.bat
rename sha512.bat sha512_migrando_fagner.bat


Get-Help Get-Verb
New-Alias -Name "g_v" Get-Verb
g_v
