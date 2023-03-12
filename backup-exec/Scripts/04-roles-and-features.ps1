<# Instala o IIS #>
Install-WindowsFeature -name Web-Server -IncludeManagementTools
Set-Service -name W3SVC -startupType Automatic
<# Instala o Servidor de Impressão #>
Install-WindowsFeature -Name Print-Server -IncludeManagementTools
Install-WindowsFeature -Name Print-LPD-Service -IncludeManagementTools
<# Instala o RSAT #>
Install-WindowsFeature -Name RSAT -IncludeManagementTools
Install-WindowsFeature -Name RSAT-Feature-Tools -IncludeManagementTools
Install-WindowsFeature -Name RSAT-SMTP -IncludeManagementTools