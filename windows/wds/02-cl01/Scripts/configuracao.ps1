# Windows Update
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Install-Module -Name PSWindowsUpdate -Force 
Import-Module PSWindowsUpdate 
Get-WindowsUpdate -Download -ForceDownload -Confirm:$false 
Get-WindowsUpdate -AcceptAll -ForceInstall -IgnoreReboot

# Executar comando abaixo para instalaÁ„o do Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Aplicativos Padr„o
choco install -Y firefox adobereader javaruntime vcredist-all vlc zoom k-litecodecpackmega googlechrome dotnetfx microsoft-edge 7zip.install ccleaner

# Criar e Habilitar plano de energia
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
$p = Get-CimInstance -Name root\cimv2\power -Class win32_PowerPlan -Filter "ElementName = 'Desempenho M·ximo'"      
powercfg /setactive ([string]$p.InstanceID).Replace("Microsoft:PowerPlan\{","").Replace("}","")

# Habilitar .NetFramework
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -NoRestart
			
<#Desabilitar UAC #>
$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
New-ItemProperty -Path $path -Name 'ConsentPromptBehaviorAdmin' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'ConsentPromptBehaviorUser' -Value 3 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableInstallerDetection' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableLUA' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'EnableVirtualization' -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'PromptOnSecureDesktop' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'ValidateAdminCodeSignatures' -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $path -Name 'FilterAdministratorToken' -Value 0 -PropertyType DWORD -Force | Out-Null

# Habilitar AÅrea de Trabalho Remota
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "¡rea de Trabalho Remota"

# Habilitar Usuario administrador e definir senha
Get-LocalUser -Name "Administrador" | Enable-LocalUser
$Password = Read-Host "Senha" -AsSecureString
$UserAccount = Get-LocalUser -Name "Administrador"
$UserAccount | Set-LocalUser -Password $Password
Restart-Computer

# Excluir usuario suporte
Remove-LocalUser -Name "Suporte"
Restart-Computer

# Renomear placa de rede cabeada para "Rede-Cabeada"
Rename-NetAdapter -Name "Ethernet" -NewName "Rede-Cabeada" -Confirm:$false

# Desabilitar ipv6
Disable-NetAdapterBinding -InterfaceAlias "Rede-Cabeada" -ComponentID ms_tcpip6











