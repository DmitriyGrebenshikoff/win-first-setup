#install chocolatey repo
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install programs from chocolatey
$list = @("googlechrome","7zip","adobereader","sharex","vlc")
foreach ($program in $list) {
    choco install $program -y --force
}

choco install office2019proplus --params '/Language:ru-ru' -y --force