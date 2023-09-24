# Instalação e Configuração do WDS
Install-WindowsFeature -name WDS -ComputerName SRV-DC01 -IncludeManagementTools
wdsutil /initialize-server /remInst:"W:\RemInstall"
wdsutil /Set-Server /Server:SRV-DC01 /AnswerClients:All
Restart-service WDSServer
Import-WdsBootImage -Path "D:\sources\boot.wim" -NewImageName "W10 22H2 Pro" -NewDescription "W10 22H2 Pro"
New-WdsInstallImageGroup -Name "W10"
Get-WindowsImage -imagePath "D:\sources\install.wim" | select Imagename
$imageName = 'Windows 10 Pro'
Import-WdsInstallImage -ImageGroup "W10" -Path "D:\sources\install.wim" -ImageName $imageName
get-command *wds*

WDSUTIL /Verbose /Progress /New-CaptureImage /Server:SRV-DC01 /Image:"W10 22H2 Pro" /Architecture:x64 /Filename:boot.wim /DestinationImage /FilePath:"W:\RemInstall\Captura\w10-22h2-pro.wim" /Name:"Captura W10 22H2 Pro" /Description:"Captura W10 22H2 Pro" /Overwrite:Yes
WDSUTIL /Add-Image /ImageFile:"W:\RemInstall\Captura\w10-22h2-pro.wim" /ImageType:Boot
