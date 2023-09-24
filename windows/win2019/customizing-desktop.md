#Autor: Fagner Geraldes Braga  
#Data de criação: 03/02/2022
#Data de atualização: 03/02/2022  
#Versão: 0.01
***

```powershell
# Abrir o PowerShell como Administrador
# Executar comando abaixo para instalação do Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

```powershell
# Aplicativos do Fagner
choco install -Y microsoft-teams.install firefox bsplayer virtualbox --params "/ExtensionPack" adobereader -params '" /UpdateMode:3"' amd-ryzen-chipset 7zip.install kindle cpu-z anki anydesk.install audacity audacity-lame audacity-ffmpeg ccleaner logitech-camera-settings crystaldiskinfo crystaldiskmark epicgameslauncher git javaruntime vcredist-all msiafterburner notepadplusplus.install putty gpu-z vlc zoom k-litecodecpackmega vscode googlechrome dotnetfx microsoft-edge keepass.install rufus malwarebytes qbittorrent hwmonitor
```
```powershell
# Aplicativos Padrão
choco install -Y firefox adobereader javaruntime vcredist-all vlc zoom k-litecodecpackmega googlechrome dotnetfx microsoft-edge 7zip.install ccleaner
```

```powershell
Debloat Windows
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))


```
```powershell
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
```

```powershell
# Aplicativos SENAC
choco install -Y firefox adobereader -params '" /UpdateMode:3"' 7zip.install git vcredist-all notepadplusplus.install putty vlc vscode googlechrome microsoft-edge
```