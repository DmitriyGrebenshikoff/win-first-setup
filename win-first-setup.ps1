#install chocolatey repo
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Install RSAT
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

#install programs from chocolatey
$list = @("googlechrome","7zip","adobereader","sharex","vlc","vscode","telegram","whatsapp","viber","wsl","microsoft-teams","filezilla","putty","sql-server-management-studio","heidisql","far","microsoft-windows-terminal","winbox","puntoswitcher")
foreach ($program in $list) {
    choco install $program -y --force
}

choco install office365proplus --params '/Language:ru-ru' -y --force