# Alias
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias grep rg
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Terminal Icons
Import-Module Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# PSReadline
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

# Zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
