function Join-EnvPath {
    param (
        [string] $PathToAdd
    )

    if ($env:PATH -notlike "*${PathToAdd}*") {
        $env:PATH = "${PathToAdd}$([System.IO.Path]::PathSeparator)$env:PATH"
    }
}

# Path
Join-EnvPath -PathToAdd (Join-Path $HOME 'bin')
# Join-EnvPath -PathToAdd 'C:\Program Files\Git\mingw64\bin\'

# Environment variables
$env:KUBE_EDITOR='nvim'
$env:EDITOR='nvim'

# Tell Yazi where to find file.exe
$env:YAZI_FILE_ONE = 'C:\Program Files\Git\usr\bin\file.exe'

# Enable dynamic tiers for Copilot Fusion model
$env:COPILOT_CLI_ENABLED_FEATURE_FLAGS = 'DYNAMIC_AUTO_TIERS'

# Alias
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias v nvim
Set-Alias grep rg
Set-Alias z zellij
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ex explorer.exe
Set-Alias s sessionizer.ps1
# Not yet my sweet prince
# Set-Alias docker wslc

# Terminal Icons
Import-Module Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# PSReadline
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

# Zoxide
# Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
