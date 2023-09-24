New-Alias -Name rename Rename-Item
$profile
Get-Help New-Item
new-item $profile
$env:USERNAME
Get-Help about_execution_policies
Get-ExecutionPolicy
Set-ExecutionPolicy Unrestricted

get-help about_*
get-help about_Profiles
$profile.AllUsersAllHosts
C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
New-Item $profile.AllUsersAllHosts
