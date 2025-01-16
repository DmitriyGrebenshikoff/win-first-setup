#install chocolatey repo
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Install RSAT
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

#install programs from winget
$wingetList = @("Google.Chrome",
                "7zip.7zip",
                "Adobe.Acrobat.Reader.64-bit",
                "ShareX.ShareX",
                "VideoLAN.VLC",
                "Git.Git",
                "TortoiseGit.TortoiseGit",
                "Fork.Fork",
                "DominikReichl.KeePass",
                "Microsoft.VisualStudioCode",
                "Telegram.TelegramDesktop",
                "9NKSQGP7F2NH", # whatsapp
                "Microsoft.WSL",
                "Microsoft.Teams",
                "PuTTY.PuTTY",
                "Devolutions.RemoteDesktopManager",
                "alexx2000.DoubleCommander",
                "9N0DX20HK701", # windows-terminal
                "Mikrotik.Winbox",
                "WireGuard.WireGuard",
                "Docker.DockerDesktop",
                "Google.GoogleDrive",
                "GnuPG.Gpg4win",
                "Yubico.YubiKeySmartCardMinidriver",
                "Yubico.YubikeyManager",
                "PaulWoolcock.SyncOutlookandGooglecalendars",
                "Mirantis.Lens",
                "Mattermost.MattermostDesktop",
                "Obsidian.Obsidian",
                "dotPDN.PaintDotNet",
                "Starship.Starship",
                "Microsoft.PowerShell",
                "Microsoft.PowerToys",
                "Yandex.Music",
                "Kubernetes.kubectl",
                "Postman.Postman",
                "Canonical.Ubuntu.2404")
foreach ($program in $wingetList) {
    winget install --id $program
}
$chocoList = @("puntoswitcher")
foreach ($program in $chocoList) {
    choco install $program -y --force
}

choco install office365proplus --params '/Language:ru-ru' -y --force

# Install Yandex Cloud CLI
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://storage.yandexcloud.net/yandexcloud-yc/install.ps1')

#Enable windows ssh-agent for VSCode
#Set-Service ssh-agent -StartupType Automatic
#Start-Service ssh-agent