#install chocolatey repo
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Install RSAT
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

#install programs from chocolatey
$list = @("googlechrome","7zip","adobereader","sharex","vlc","git","keepass","vscode","telegram","whatsapp","viber","wsl","wsl-ubuntu-2004","microsoft-teams","filezilla","putty.install","sql-server-management-studio","heidisql","far","microsoft-windows-terminal","winbox","puntoswitcher")
foreach ($program in $list) {
    choco install $program -y --force
}

choco install office365proplus --params '/Language:ru-ru' -y --force

#Enable windows ssh-agent for VSCode
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent