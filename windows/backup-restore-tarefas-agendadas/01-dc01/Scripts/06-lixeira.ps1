Import-module ActiveDirectory
Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target grupo2.intra
Get-ADOptionalFeature -filter *